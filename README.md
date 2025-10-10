# PAM
Personal Assistance Machine
This artificial intelligence consists of a large language model for tropical storm simulations.

# Large Language Model (LLM) Files (GGUF)
The system is locally hosted. The prerequisite are the associated GGUF files. Please create a directory called `symlink` in the root that directs the orchestrator to find the LLM files. To create the symbolic link, use the following command by replacing the `/path/to/ggufs` with the path to the LLM files.

`ln -s /path/to/ggufs ./symlink`

## Updating Model
If we are switching the LLM or otherwise updating it, we need to ensure that the llama.cpp server configuration reflects it.
 - In the `docker/llm` directory there is a  `entrypoint.sh` file that contains the initial configuration. Please update the GGUF filename with the first in the sequence for the `--model` flag.
 - Update the `symlink` by safely removing it with `unlink symlink`

## Downloading Models
Currently, the design supports command line interfaces such as the [hf download cli](https://huggingface.co/docs/huggingface_hub/en/guides/cli#download-multiple-files). Please reference the following command to understand how to download a LLM to a locally specified directory. Note that we utilize file matching patterns with `--include`.

```
hf download unsloth/Apertus-8B-Instruct-2509-GGUF --include "*UD-Q8_K_XL*" --local-dir .
```

# Trusted Platform Module (TPM)
The TPM can be configured such that the application is compliant with rigorous security standards and for data science purposes such as random number generation. The following command describes how to configure a TPM chip to work with a container.

`docker run --device /dev/tpm0:/dev/tpm0 --device /dev/tpmrm0:/dev/tpmrm0`

# Quickstart

1. `docker build -t pam docker/`
2. `sudo docker run -d -v .:/data/ -p 10000:10000 pam`

# Networking Quickstart

The reverse proxy is configured externally. For example, [this configuration file](https://github.com/hammad93/hurricane-server/blob/main/docker/proxy/conf.d/open-webui.conf) is an example of how to configure it.
