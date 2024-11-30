#!/bin/bash

# Check if any arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file_path> <output_file_path>"
    exit 1
fi



CURRENT_DIR=$(pwd)
THIS_SCRIPT_DIR=$(dirname "$(realpath "$0")")
    
ABSOLUTE_INPUT_PATH=$(realpath "$1" 2>/dev/null)
    if [ $? -ne 0 ]; then
        echo "Error: '$1' does not exist or is invalid."

    else
        ABSOLUTE_OUTPUT_PATH=$(cd "$(dirname "$2")" && pwd)/$(basename "$2")
        echo $ABSOLUTE_INPUT_PATH
        echo $ABSOLUTE_OUTPUT_PATH
        python3 "${THIS_SCRIPT_DIR}/format_cpl_jlc.py" $ABSOLUTE_INPUT_PATH $ABSOLUTE_OUTPUT_PATH
    fi



# Run the Python script

