cd /llama.cpp/build/bin/
./llama-server \
    --model /data/Apertus-8B-Instruct-2509-UD-Q8_K_XL.gguf \
    --port 10000 \
    --ctx-size 4096 \
    --threads 64 \
    --host 0.0.0.0 \
    --mlock \
    --no-mmap \
    --offline
