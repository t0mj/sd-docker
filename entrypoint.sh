#!/bin/bash

set -euo pipefail

export TARGET_DIR="/opt/stable-diffusion-webui"

chown -R sd:sd "$TARGET_DIR"

# Drop privileges and execute the main logic as the `sd` user.
runuser -u sd -- /bin/bash -s -- "$@" <<'EOF'
    set -euo pipefail

    if [ ! -d "$TARGET_DIR/.git" ]; then
        echo "Cloning stable-diffusion-webui into $TARGET_DIR..."
        git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui "$TARGET_DIR"
        chmod 755 "$TARGET_DIR/webui.sh"
    fi

    cd "$TARGET_DIR"
    [ -d "venv" ] || python3.10 -m venv venv
    bash ./webui.sh "$@"
EOF
