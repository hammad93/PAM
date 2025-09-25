cd /llama.cpp/build/bin/
./llama-server \
    --model /data/swiss-ai.Apertus-70B-Instruct-2509.Q8_0-00001-of-00006.gguf \
    --port 10000 \
    --ctx-size 4096 \
    --threads 64 \
    --host 0.0.0.0 \
    --no-nmap \
    --offline
