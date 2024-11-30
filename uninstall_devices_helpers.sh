#!/bin/bash


SCRIPT_DIR=$(realpath "./")
SHELL_CONFIG="$HOME/.bashrc"

if [ "$SHELL" == "/bin/zsh" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
fi

SCRIPT_PATH_CPL_JLC="./format_cpl_jlc.sh"
SCRIPT_NAME_CPL_JLC=$(basename "$SCRIPT_PATH_CPL_JLC")

chmod -x "$SCRIPT_PATH_CPL_JLC"

# Remove the script's directory from PATH in the shell configuration
if grep -q "export PATH=\"$SCRIPT_DIR" "$SHELL_CONFIG"; then
    sed -i "\|export PATH=\"$SCRIPT_DIR|d" "$SHELL_CONFIG"
    echo "Removed $SCRIPT_DIR from PATH in $SHELL_CONFIG."
    PATH=$(echo "$PATH" | sed -e "s|$SCRIPT_DIR:||" -e "s|:$SCRIPT_DIR||")  # Update current session
    echo "Temporary PATH updated for this session."
else
    echo "Directory $SCRIPT_DIR not found in $SHELL_CONFIG."
fi

echo "Uninstallation complete."