# Quick Stable Diffusion Web UI Docker Setup

This repository provides a simple Docker and Docker Compose setup for running the [AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui).

It's designed to be a very fast, quick, and dirty method to get a containerized instance of the web UI up and running with minimal configuration.

## How It Works

This setup essentially automates the steps outlined in the official [Install and Run on NVidia GPUs](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Install-and-Run-on-NVidia-GPUs) guide within a Docker container.

When you run `docker-compose up`, it will:
1.  Create a local folder named `sd-data`.
2.  Clone the latest version of the `stable-diffusion-webui` repository into it.
3.  Install dependencies and launch the web UI.

All models, outputs, and configuration will be stored in the `sd-data` folder on your local machine.

## Updating or Resetting

To update the web UI to the latest version or to perform a clean reset, simply stop the container (`docker-compose down`), delete the local `sd-data` folder, and run `docker-compose up` again. This will re-download everything from scratch.
