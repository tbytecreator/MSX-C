#!/usr/bin/env python3
"""Convert Intel HEX file to COM (binary) format"""
import sys
import struct

def ihex_to_com(ihex_file, com_file):
    """Convert Intel HEX to COM binary format
    
    MSX-DOS .COM files are loaded at 0x0100 in memory,
    but the file itself should NOT include the 0x0100 offset.
    The first byte of the file will be loaded at address 0x0100.
    """
    memory = {}
    min_addr = float('inf')
    max_addr = 0
    base_addr = 0x0100  # MSX-DOS COM load address
    
    with open(ihex_file, 'r') as f:
        for line in f:
            line = line.strip()
            if not line or line[0] != ':':
                continue
                
            # Parse Intel HEX record
            byte_count = int(line[1:3], 16)
            address = int(line[3:7], 16)
            record_type = int(line[7:9], 16)
            
            if record_type == 0:  # Data record
                data_start = 9
                for i in range(byte_count):
                    byte_val = int(line[data_start + i*2:data_start + i*2 + 2], 16)
                    memory[address + i] = byte_val
                    min_addr = min(min_addr, address + i)
                    max_addr = max(max_addr, address + i)
            elif record_type == 1:  # End of file
                break
    
    # Adjust addresses - remove the base address offset
    if min_addr >= base_addr:
        adjusted_min = 0
        adjusted_max = max_addr - base_addr
    else:
        adjusted_min = min_addr
        adjusted_max = max_addr
    
    # Write binary file without the 0x0100 offset
    with open(com_file, 'wb') as f:
        if min_addr >= base_addr:
            # Normal case: write from base_addr onwards, but into file position 0
            for addr in range(base_addr, max_addr + 1):
                f.write(bytes([memory.get(addr, 0)]))
        else:
            # Unusual case: data below 0x0100
            for addr in range(min_addr, max_addr + 1):
                f.write(bytes([memory.get(addr, 0)]))
    
    file_size = adjusted_max - adjusted_min + 1
    print(f"Converted {ihex_file} to {com_file}")
    print(f"Memory range: 0x{min_addr:04X} - 0x{max_addr:04X}")
    print(f"File size: {file_size} bytes")

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <input.ihx> <output.com>")
        sys.exit(1)
    
    ihex_to_com(sys.argv[1], sys.argv[2])
