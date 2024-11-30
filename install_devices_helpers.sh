#!/bin/bash

SCRIPT_DIR=$(realpath "./")
SHELL_CONFIG="$HOME/.bashrc"

# add support for .bashrc and if neither file exist
if [ "$SHELL" == "/bin/zsh" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
fi

SCRIPT_PATH_CPL_JLC="./format_cpl_jlc.sh"
SCRIPT_NAME_CPL_JLC=$(basename "$SCRIPT_PATH_CPL_JLC")

chmod +x "$SCRIPT_PATH_CPL_JLC"
    echo "Made $SCRIPT_NAME_CPL_JLC executable."


if [[ ":$PATH:" != *":$SCRIPT_DIR:"* ]]; then
    echo "export PATH=\"$SCRIPT_DIR:\$PATH\"" >> "$SHELL_CONFIG"
    echo "Added $SCRIPT_DIR to PATH in $SHELL_CONFIG."
    export PATH="$SCRIPT_DIR:$PATH"  # Temporary update for current session
    echo "Temporary PATH updated for this session."
    echo "Sourcing $SHELL_CONFIG to apply changes..."
    source "$SHELL_CONFIG"
else
    echo "Directory $SCRIPT_DIR is already in PATH."
fi

echo "Installation complete. Please run "source ~/.zshrc" You can now run devices helpers from anywhere from anywhere."


# NOTE: this implies that all scripts that are to be installed are in the root directory. If hierarchies are introduced, then scripts have to be 