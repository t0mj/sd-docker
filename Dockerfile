FROM python:3.10-trixie

RUN apt-get update && apt-get install -y libgl1 git

COPY entrypoint.sh /opt/entrypoint.sh

RUN useradd -ms /bin/bash sd && \
    mkdir -p /opt/stable-diffusion-webui && \
    chown sd:sd /opt/stable-diffusion-webui && \
    chmod +x /opt/entrypoint.sh
    chmod +x /opt/stable-diffusion-webui/webui.sh

VOLUME /opt/stable-diffusion-webui
EXPOSE 7860

ENTRYPOINT [ "/opt/entrypoint.sh" ]
