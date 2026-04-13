#!/bin/bash
cd /llama.cpp/build/bin/
./llama-server \
    --model /data/gpt-oss-120b-F16.gguf \
    --port 10000 \
    --ctx-size 131072 \
    --threads 32 \
    --host 0.0.0.0 \
    --offline \
    --flash-attn on \
    --mlock \
    --no-mmap \
    --numa distribute
