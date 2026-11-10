#!/usr/bin/env bash

set -eu

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR"

PROGRAM=MENU
SOURCE=MENU.C
INCLUDE_DIR=fusion-c/include
LIB_DIR=fusion-c/lib
DEST=dsk
ADDR_CODE=0x106
ADDR_DATA=0x0

printf '%s\n' '-------- Compilation of :'
printf '%s\n' "${1-}"
printf '.\n'

for tool in sdcc hex2bin; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        printf 'Error: %s was not found in PATH. Install it and try again.\n' "$tool" >&2
        exit 127
    fi
done

for path in "$SOURCE" "$INCLUDE_DIR/crt0_msxdos.rel" "$LIB_DIR/fusion.lib"; do
    if [ ! -f "$path" ]; then
        printf 'Error: required build file was not found: %s\n' "$path" >&2
        exit 1
    fi
done

if [ ! -d "$DEST" ]; then
    printf 'Error: destination directory was not found: %s\n' "$DEST" >&2
    exit 1
fi

sdcc \
    --code-loc "$ADDR_CODE" \
    --data-loc "$ADDR_DATA" \
    --disable-warning 196 \
    --sdcccall 0 \
    --no-optsdcc-in-asm \
    -mz80 \
    --no-std-crt0 \
    --opt-code-size \
    fusion.lib \
    -L "$LIB_DIR" \
    "$INCLUDE_DIR/crt0_msxdos.rel" \
    "$SOURCE"

if [ ! -f "$PROGRAM.ihx" ]; then
    printf 'Error: compilation did not produce %s.ihx.\n' "$PROGRAM" >&2
    exit 1
fi

printf '%s\n' '... Compilation OK'
hex2bin -e com "$PROGRAM.ihx"
cp -- "$PROGRAM.com" "$DEST/$PROGRAM.com"

rm -f -- \
    "$PROGRAM.com" \
    "$PROGRAM.asm" \
    "$PROGRAM.ihx" \
    "$PROGRAM.lk" \
    "$PROGRAM.lst" \
    "$PROGRAM.map" \
    "$PROGRAM.noi" \
    "$PROGRAM.sym" \
    "$PROGRAM.rel"

printf '%s\n' 'Done.'

if command -v pgrep >/dev/null 2>&1 && pgrep -x openmsx >/dev/null 2>&1; then
    printf '%s\n' 'openMSX already running.'
elif command -v openmsx >/dev/null 2>&1; then
    nohup openmsx -script "$SCRIPT_DIR/openMSX/emul_start_config.txt" \
        >/dev/null 2>&1 </dev/null &
    printf 'Starting openMSX (PID %s).\n' "$!"
elif command -v flatpak >/dev/null 2>&1 \
    && flatpak info org.openmsx.openMSX >/dev/null 2>&1; then
    nohup flatpak run --filesystem="$SCRIPT_DIR" org.openmsx.openMSX \
        -script "$SCRIPT_DIR/openMSX/emul_start_config.txt" \
        >/dev/null 2>&1 </dev/null &
    printf 'Starting openMSX via Flatpak (PID %s).\n' "$!"
else
    printf '%s\n' 'Warning: openMSX is not installed; emulator was not started.' >&2
fi
