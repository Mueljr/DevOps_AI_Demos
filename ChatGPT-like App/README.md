# CHAT-GPT LIKE APP WITH AI OPEN-SOURCE MODELS

# PROJECT OVERVIEW

This project provides a local ChatGPT-like experience using open-source AI models. With Ollama for running large language models (LLMs) and Open WebUI for an intuitive chat interface, you can interact with AI models privately on your machine.

# PREREQUISITES

1. Install Docker; Ensure Docker Desktop is running.
2. Install Ollama.

# MAJOR STEPS

1️. **Install Ollama**– Set up the LLM runtime - Linux, Windows, MacOS

2️. **Download a Model** – Choose & pull an AI model locally

3️. **Run Open WebUI** – Start a chat-friendly interface using Docker

# PROJECT USE CASES
- This setup is useful for self-hosted AI chat models that run locally instead of relying on cloud-based services like ChatGPT or Deepseek.

- Easier to access without internet, privacy. Benefit of saving cost from extra subscription, and opportunity to tweak models.

- Model development and to get feedback from people locally.

- When unsure of answers by a model, you can validate with another model easily.


# docker-compose file

Folder contains a docker-compose.yml file to run command at any other time - as an alternative to the docker run command.

Easier to manage and reuse. You can add more services without modifying the original. Likewise, in case there's a need to restart or rerun model at any point in time easily without typing one long line (*docker run...*)


# ollama-stabiliser file

This script helps stabilize and retry downloads of Ollama models in cases where:

1. Ollama's servers are experiencing slow or unstable connections.
  
2. Your internet connection is fluctuating, causing failed downloads.

_Specify your model before executing script_
