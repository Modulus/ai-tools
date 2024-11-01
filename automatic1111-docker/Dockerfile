FROM ubuntu:20.04


# RUN apt update && apt install locales

# RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
#     locale-gen
# ENV LANG en_US.UTF-8  
# ENV LANGUAGE en_US:en  
# ENV LC_ALL en_US.UTF-8     

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

# Ubuntu 24.04
RUN apt update && apt install -y software-properties-common wget git python3 python3-venv libgl1 libglib2.0-0
RUN add-apt-repository ppa:deadsnakes/ppa && apt update && apt install -y python3.11 python3-pip

ENV python_cmd="python3.11"

RUN mkdir /automatic && chown -R nobody:nogroup /automatic

WORKDIR /automatic



RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh

EXPOSE 7860

USER nobody


ENTRYPOINT [ "/usr/bin/bash", "./webui.sh" ]