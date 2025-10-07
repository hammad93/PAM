FROM continuumio/anaconda3
RUN apt-get update && apt-get install -y build-essential
# RUN apt-get install -y tpm2tools libtss2-dev

# Install llama.cpp
RUN git clone https://github.com/ggml-org/llama.cpp.git
WORKDIR llama.cpp
RUN apt install cmake -y
RUN cmake -B build -DLLAMA_CURL=OFF
RUN cmake --build build --config Release

# Entrypoint
ADD entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
