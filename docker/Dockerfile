FROM continuumio/anaconda3
RUN apt-get update && apt-get install -y build-essential

# Install llama.cpp
RUN git clone https://github.com/ggerganov/llama.cpp.git
WORKDIR llama.cpp
RUN apt install cmake -y
RUN cmake -B build
RUN cmake --build build --config Release

# Entrypoint
ADD entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
