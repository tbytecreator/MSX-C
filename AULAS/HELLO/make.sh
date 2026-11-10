#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$SCRIPT_DIR"

CC=sdcc
HEX2COM=./Tools/ihex2com.py
SOURCE=hello.c
PROGRAM=hello
DEST=dsk
INCLUDEDIR=./fusion-c/include
LIBDIR=./fusion-c/lib
CRT0="$INCLUDEDIR/crt0_msxdos.rel"
ADDR_CODE=0x106
ADDR_DATA=0x0

echo "-------- Compilation of:"
echo "$SOURCE"
echo "."

if ! command -v "$CC" >/dev/null 2>&1; then
    echo "Error: $CC was not found. Install SDCC and try again." >&2
    exit 1
fi

if ! command -v python3 >/dev/null 2>&1; then
    echo "Error: python3 was not found." >&2
    exit 1
fi

# Fusion-C uses SDCC's legacy Z80 calling convention and object metadata.
"$CC" --code-loc "$ADDR_CODE" --data-loc "$ADDR_DATA" \
    --disable-warning 196 --sdcccall 0 --no-optsdcc-in-asm \
    -mz80 --no-std-crt0 --opt-code-size \
    -I ./fusion-c/header/ fusion.lib -L "$LIBDIR" "$CRT0" "$SOURCE"

if [ ! -f "$PROGRAM.ihx" ]; then
    echo "Error: compilation did not produce $PROGRAM.ihx." >&2
    exit 1
fi

echo "... Compilation OK"
python3 "$HEX2COM" "$PROGRAM.ihx" "$PROGRAM.com"
cp -f "$PROGRAM.com" "$DEST/$PROGRAM.com"
rm -f "$PROGRAM.com" "$PROGRAM.asm" "$PROGRAM.ihx" "$PROGRAM.lk" \
    "$PROGRAM.lst" "$PROGRAM.map" "$PROGRAM.noi" "$PROGRAM.sym" \
    "$PROGRAM.rel"

echo "Done."
./openMSX/emul_start.sh
