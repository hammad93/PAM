#!/bin/bash
cat << 'EOF'
  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. |
| |   ______     | || |      __      | || | ____    ____ | |
| |  |_   __ \   | || |     /  \     | || ||_   \  /   _|| |
| |    | |__) |  | || |    / /\ \    | || |  |   \/   |  | |
| |    |  ___/   | || |   / ____ \   | || |  | |\  /| |  | |
| |   _| |_      | || | _/ /    \ \_ | || | _| |_\/_| |_ | |
| |  |_____|     | || ||____|  |____|| || ||_____||_____|| |
| |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------' 
EOF
# Check if the symbolic link exists
if [[ -L "./symlink" ]]; then
    echo "Symbolic link exists: ./symlink with files:"
    ls -la symlink/
else
    echo "Error: Symbolic link does not exist: ./symlink" >&2
    exit 1
fi

docker system prune -a
docker compose build --no-cache
#docker compose build
docker compose up -d
