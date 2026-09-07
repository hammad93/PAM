# PAM
Personal Assistance Machine
This artificial intelligence consists of a large language model for tropical storm simulations.

## Large Language Model (LLM) Files (GGUF)
The system is locally hosted. The prerequisite are the associated GGUF files. Please create a directory called `symlink` in the root that directs the orchestrator to find the LLM files. To create the symbolic link, use the following command by replacing the `/path/to/ggufs` with the path to the LLM files.

`ln -s /path/to/ggufs ./symlink`

### Updating Model
If we are switching the LLM or otherwise updating it, we need to ensure that the llama.cpp server configuration reflects it.
 - In the `docker/llm` directory there is a  `entrypoint.sh` file that contains the initial configuration. Please update the GGUF filename with the first in the sequence for the `--model` flag.
 - Update the `symlink` by safely removing it with `unlink symlink`

### Downloading Models
Currently, the design supports command line interfaces such as the [hf download cli](https://huggingface.co/docs/huggingface_hub/en/guides/cli#download-multiple-files). Please reference the following command to understand how to download a LLM to a locally specified directory. Note that we utilize file matching patterns with `--include`.

```
hf download unsloth/Apertus-8B-Instruct-2509-GGUF --include "*UD-Q8_K_XL*" --local-dir .
```

## Agentic Harness
An agentic harness enables the inference of a large language model to be utilized in a more complex state machine. Whereas the basic inference of a LLM can be compared to a finite state transducer (FST), an agentic harness that includes LLM inference is better compared to a Turing machine (TM). The supported harness for this repository is [OpenCode](https://github.com/anomalyco/opencode). Although other options can be utilized, this repository integrates the local _llama.cpp_ inference engine with an offline OpenWebUI instance as a LLM provider through an authenticated OpenAI API implementation. Instructions on how to set this up include,

1. [Enable LLM provider](https://docs.openwebui.com/reference/api-endpoints/) API access through OpenWebUI or similar.
2. [Install OpenCode](https://github.com/anomalyco/opencode#installation) by following the steps outlined in their public git repository.
3. Run `opencode auth login` and search for the `Other` provider option to enter in a custom provider.
4. Follow the instructions to initialize a custom LLM provider
   - The provider id can be anything, but it is _PAM_ in our example.
   - Enter in the API access key produced after enabling API access to inference engine.
6. Edit the default JSON configuration file `~/.config/opencode/opencode.jsonc`. Navigate to the example in this section for additional details.
7. Finally, run the start command `opencode` to load the local LLM(s) by default.

### Example OpenCode Configuration

This working example has the OpenWebUI OpenAI API endpoint specified as _https://nfc.ai/api/v1_ that needs to be changed. Note that the specific model name must be defined as another key in the `models` object for a `provider` as constructed in this section (in this example, it is _/data/gpt-oss-120F16.gguf_). On the other hand, the `name` parameter in the object for the specific model can be anything.

```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "PAM": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Personal Assistance Machine",
      "options": {
        "baseURL": "https://nfc.ai/api/v1"
      },
      "models": {
        "/data/gpt-oss-120b-F16.gguf": {
          "name": "gpt-oss 120b"
        }
      }
    }
  }
}
```

## Trusted Platform Module (TPM)
The TPM can be configured such that the application is compliant with rigorous security standards and for data science purposes such as random number generation. The following command describes how to configure a TPM chip to work with a container.

`docker run --device /dev/tpm0:/dev/tpm0 --device /dev/tpmrm0:/dev/tpmrm0`

## Quickstart

1. `docker build -t pam docker/`
2. `sudo docker run -d -v .:/data/ -p 10000:10000 pam`

### Networking Quickstart

The reverse proxy is configured externally. For example, [this configuration file](https://github.com/hammad93/hurricane-server/blob/main/docker/proxy/conf.d/open-webui.conf) is an example of how to configure it.
