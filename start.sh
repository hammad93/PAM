#!/bin/bash
# Check if the symbolic link exists
if [[ -L "./symlink" ]]; then
    echo "Symbolic link exists: $link_path with files:"
    ls -la ./symlink
else
    echo "Error: Symbolic link does not exist: ./symlink" >&2
    exit 1
fi

docker compose build --no-cache
docker compose up -d