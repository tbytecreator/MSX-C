#!/bin/bash

# ============================================================================
# Fortaleza de Berdolock - Build and Test Script
# Compiles the ROM and runs it in OpenMSX (flatpak)
# ============================================================================

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Directories
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROM_DIR="$PROJECT_DIR/rom"
SRC_DIR="$PROJECT_DIR/src"

# Files
ROM_FILE="$ROM_DIR/fortaleza.rom"

# ============================================================================
# Functions
# ============================================================================

print_header() 
{
    echo -e "${YELLOW}========================================${NC}"
    echo -e "${YELLOW}$1${NC}"
    echo -e "${YELLOW}========================================${NC}"
}

print_success() 
{
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() 
{
    echo -e "${RED}✗ $1${NC}"
}

check_dependencies() 
{
    print_header "Checking Dependencies"
    
    # Check SDCC
    if ! command -v sdcc &> /dev/null; then
        print_error "SDCC not found! Please install SDCC."
        echo "  Ubuntu/Debian: sudo apt-get install sdcc"
        echo "  Fedora: sudo dnf install sdcc"
        echo "  Arch: sudo pacman -S sdcc"
        exit 1
    fi
    print_success "SDCC found: $(sdcc --version | head -n 1)"
    
    # Check Node.js
    if ! command -v node &> /dev/null; then
        echo -e "${YELLOW}Node.js not found.${NC}"
        read -p "Would you like to install Node.js? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_header "Installing Node.js"
            
            # Detect package manager and install accordingly
            if command -v apt-get &> /dev/null; then
                print_header "Using apt-get (Ubuntu/Debian)"
                sudo apt-get update && sudo apt-get install -y nodejs npm
            elif command -v dnf &> /dev/null; then
                print_header "Using dnf (Fedora)"
                sudo dnf install -y nodejs npm
            elif command -v pacman &> /dev/null; then
                print_header "Using pacman (Arch)"
                sudo pacman -S --noconfirm nodejs npm
            elif command -v brew &> /dev/null; then
                print_header "Using brew (macOS)"
                brew install node
            else
                print_error "Could not detect package manager."
                echo "Please install Node.js manually from: https://nodejs.org/"
                exit 1
            fi
            
            # Verify installation
            if command -v node &> /dev/null; then
                print_success "Node.js installed: $(node --version)"
            else
                print_error "Node.js installation failed. Please install manually."
                exit 1
            fi
        else
            print_error "Node.js is required but not installed."
            exit 1
        fi
    else
        print_success "Node.js found: $(node --version)"
    fi
    
    # Check OpenMSX
    if ! command -v flatpak &> /dev/null; then
        print_error "Flatpak not found! Please install Flatpak."
        echo "  Ubuntu/Debian: sudo apt-get install flatpak"
        echo "  Fedora: sudo dnf install flatpak"
        echo "  Arch: sudo pacman -S flatpak"
        exit 1
    fi
    print_success "Flatpak found"
    
    # Check if OpenMSX flatpak is installed
    if ! flatpak list --app | grep -q "org.openmsx.openMSX"; then
        echo -e "${YELLOW}OpenMSX flatpak not found.${NC}"
        read -p "Would you like to install OpenMSX flatpak? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_header "Installing OpenMSX"
            flatpak install -y flathub org.openmsx.openMSX
            print_success "OpenMSX installed"
        fi
    else
        print_success "OpenMSX flatpak is installed"
    fi
}

compile_rom() 
{
    if type -P node; then
	    node engine/script/js/build.js $1 $2 $3 $4 $5 $6 $7 $8 $9
    else
	    tools/build/Node/node engine/script/js/build.js $1 $2 $3 $4 $5 $6 $7 $8 $9
    fi
}

run_in_openmsx() {
    print_header "Launching OpenMSX with Fortaleza"
    
    if [ ! -f "$ROM_FILE" ]; then
        print_error "ROM file not found: $ROM_FILE"
        exit 1
    fi
    
    # Get absolute path for ROM
    ROM_ABS_PATH=$(cd "$(dirname "$ROM_FILE")" && pwd)/$(basename "$ROM_FILE")
    
    echo "Starting OpenMSX..."
    echo "ROM: $ROM_ABS_PATH"
    
    # Launch with filesystem access permission
    flatpak run --filesystem=host org.openmsx.openMSX -cart "$ROM_ABS_PATH" &
    
    # Wait a moment for OpenMSX to start
    sleep 3
    
    print_success "OpenMSX launched with Fortaleza ROM"
    echo -e "${YELLOW}Close OpenMSX window when you're done testing.${NC}"
}

show_usage() {
    cat << EOF
Fortaleza de Berdolock - Build Script

Usage: ./make.sh [OPTIONS]

OPTIONS:
    compile     Compile the ROM only
    run         Run the game in OpenMSX (requires existing ROM)
    build       Compile and run (default)
    check       Check dependencies only
    clean       Clean build artifacts
    distclean   Remove all generated files
    help        Show this help message

EXAMPLES:
    ./make.sh              # Compile and run
    ./make.sh compile      # Only compile
    ./make.sh run          # Run existing ROM
    ./make.sh clean        # Clean build artifacts
EOF
}

# ============================================================================
# Main Script
# ============================================================================

# Default action
ACTION="build"

# Parse arguments
if [ $# -gt 0 ]; then
    ACTION="$1"
fi

# Execute requested action
case "$ACTION" in
    compile)
        check_dependencies
        compile_rom
        ;;
    run)
        run_in_openmsx
        ;;
    build)
        check_dependencies
        compile_rom
        run_in_openmsx
        ;;
    check)
        check_dependencies
        ;;
    clean)
        print_header "Cleaning Build Artifacts"
        make -C "$PROJECT_DIR" clean
        print_success "Build artifacts cleaned"
        ;;
    distclean)
        print_header "Removing All Generated Files"
        make -C "$PROJECT_DIR" distclean
        print_success "All generated files removed"
        ;;
    help)
        show_usage
        ;;
    *)
        echo -e "${RED}Unknown action: $ACTION${NC}"
        show_usage
        exit 1
        ;;
esac

print_header "Done!"
