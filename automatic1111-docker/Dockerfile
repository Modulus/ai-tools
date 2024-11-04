# FROM ubuntu:20.04


# # RUN apt update && apt install locales

# # RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
# #     locale-gen
# # ENV LANG en_US.UTF-8  
# # ENV LANGUAGE en_US:en  
# # ENV LC_ALL en_US.UTF-8     

# ENV LANG=C.UTF-8
# ENV LC_ALL=C.UTF-8
# ARG DEBIAN_FRONTEND=noninteractive

# # Ubuntu 24.04
# RUN apt update && apt install -y software-properties-common wget git python3 python3-venv libgl1 libglib2.0-0
# RUN add-apt-repository ppa:deadsnakes/ppa && apt update && apt install -y python3.11 python3-pip

# ENV python_cmd="python3.11"

# RUN mkdir /automatic && chown -R nobody:nogroup /automatic

# WORKDIR /automatic



# RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh


# USER nobody
# RUN alias pip="pip3"

# ENTRYPOINT [ "/usr/bin/bash", "./webui.sh" ]




# FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

FROM ubuntu:20.04 
# FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04
#python


ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && apt-get install -y --no-install-recommends \
	libgl1 libglib2.0-0 \
	python3 python3-venv \
    python3-pip \
	git \
	wget \
	vim \
	inetutils-ping \
	sudo \
	net-tools \
	iproute2 \
	&& \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*


ENV VIRTUAL_ENV="/app/stable-diffusion-webui/venv"
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN mkdir /app

WORKDIR "/stable-diffusion-webui/"

ENV TORCH_COMMAND="pip install torch==2.1.2"
# --skip-torch-cuda-test"

RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
RUN chmod +x webui.sh
ENV install_dir="/app"

# RUN python3 -m pip install torch==2.1.2 torchvision==0.16.2 --extra-index-url https://download.pytorch.org/whl/cu121

RUN ./webui.sh -f can_run_as_root --exit --skip-torch-cuda-test


WORKDIR "/app/stable-diffusion-webui/"

VOLUME /app/stable-diffusion-webui/models


EXPOSE 7860

CMD ["python3", "launch.py", "--listen", "--skip-torch-cuda-test"]