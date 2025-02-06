cd /llama.cpp/build/bin/
./llama-server \
    --model /data/DeepSeek-R1-GGUF/DeepSeek-R1-UD-Q2_K_XL/DeepSeek-R1-UD-Q2_K_XL-00001-of-00005.gguf \
    --port 10000 \
    --ctx-size 8192 \
    --threads 64 \
    --host 0.0.0.0
