

#FROM ubuntu:22.04 
 FROM rocm/pytorch:rocm6.2.3_ubuntu22.04_py3.10_pytorch_release_2.3.0_triton_llvm_reg_issue
#rocm/pytorch:rocm6.2.2_ubuntu22.04_py3.10_pytorch_release_2.1.2
# FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04
#python


ENV DEBIAN_FRONTEND="noninteractive"
ENV TORCH_COMMAND='pip install torch torchvision --extra-index-url https://download.pytorch.org/whl/rocm5.1.1'
ENV COMMANDLINE_ARGS="--skip-torch-cuda-test"

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
    gcc \
    python3-dev \
	&& \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*





ENV VIRTUAL_ENV="/app/stable-diffusion-webui/venv"
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN mkdir /app

WORKDIR "/stable-diffusion-webui/"

# ENV TORCH_COMMAND="pip install torch==2.1.2"
# --skip-torch-cuda-test"

RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
RUN chmod +x webui.sh
ENV install_dir="/app"

# RUN python3 -m pip install torch==2.1.2 torchvision==0.16.2 --extra-index-url https://download.pytorch.org/whl/cu121

RUN ./webui.sh -f can_run_as_root --exit --precision full --no-half


WORKDIR "/app/stable-diffusion-webui/"

# Added by me, needed to install models from huggingface
#RUN git lfs install && git clone https://huggingface.co/black-forest-labs/FLUX.1-schnell
# ENV GIT_LFS_SKIP_SMUDGE=1 #Comment this in if you want to skip download of large files
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN git clone https://huggingface.co/black-forest-labs/FLUX.1-schnell models/FLUX.1-schnell
 

VOLUME /app/stable-diffusion-webui/models

RUN (. /etc/lsb-release && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh |  env os=ubuntu dist="${DISTRIB_CODENAME}" bash)

RUN apt-get install git-lfs
RUN git clone https://huggingface.co/black-forest-labs/FLUX.1-schnell models/FLUX.1-schnell                                                                                                           


EXPOSE 7860

CMD ["python3", "launch.py", "--listen", "--precision",  "full", "--no-half"]
