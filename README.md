# PAM
Personal Assistance Machine

# Large Language Model (LLM) Files (GGUF)
The system is locally hosted. The prerequisite are the associated GGUF files. Please create a directory called `symlink` in the root that directs the orchestrator to find the LLM files.

# Quickstart

1. `docker build -t pam docker/`
2. `sudo docker run -d -v .:/data/ -p 10000:10000 pam`

# Networking Quickstart

The reverse proxy is configured externally. For example, [this configuration file](https://github.com/hammad93/hurricane-server/blob/main/docker/proxy/conf.d/open-webui.conf) is an example of how to configure it.