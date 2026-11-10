#!/usr/bin/env bash

set -eu

cd -- "$(dirname -- "$0")"

PROGRAM=function
INCLUDE_DIR=fusion-c/include
LIB_DIR=fusion-c/lib
ADDR_CODE=0x106
ADDR_DATA=0x0

printf '%s\n' '-------- Compilation of :'
printf '%s\n' "${1-}"
printf '.\n'

if ! command -v sdcc >/dev/null 2>&1; then
    printf '%s\n' 'Error: sdcc was not found in PATH.' >&2
    exit 127
fi

if ! command -v hex2bin >/dev/null 2>&1; then
    printf '%s\n' 'Error: hex2bin was not found in PATH.' >&2
    exit 127
fi

if sdcc \
    --code-loc "$ADDR_CODE" \
    --data-loc "$ADDR_DATA" \
    --disable-warning 196 \
    -mz80 \
    --no-std-crt0 \
    --opt-code-size \
    fusion.lib \
    -L "$LIB_DIR" \
    "$INCLUDE_DIR/crt0_msxdos.rel" \
    "$PROGRAM.c"
then
    :
elif [ ! -f "$PROGRAM.ihx" ]; then
    printf 'Error: SDCC failed without producing %s.ihx.\n' "$PROGRAM" >&2
    exit 1
fi

if [ ! -f "$PROGRAM.ihx" ]; then
    printf 'Error: compilation did not produce %s.ihx.\n' "$PROGRAM" >&2
    exit 1
fi

printf '%s\n' '... Compilation OK'
hex2bin -e com "$PROGRAM.ihx"
cp -- "$PROGRAM.com" "dsk/$PROGRAM.com"

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

if pgrep -x openmsx >/dev/null 2>&1; then
    printf '%s\n' 'openMSX already running.'
elif command -v flatpak >/dev/null 2>&1; then
    flatpak run --filesystem="$PWD" org.openmsx.openMSX \
        -script "$PWD/openMSX/emul_start_config.txt" &
    printf 'Starting openMSX (PID %s).\n' "$!"
else
    printf '%s\n' 'Warning: flatpak was not found in PATH; openMSX was not started.' >&2
fi
