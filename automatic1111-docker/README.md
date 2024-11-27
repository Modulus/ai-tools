docker build -t auto . 
docker run --rm --name auto -p 7860 -d auto

docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $HOME/dockerx:/dockerx rocm/pytorch


## TODO: Add flux model download

## Get to work on amd

https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Install-and-Run-on-AMD-GPUs



#### Flux schnell install
git lfs install
git clone https://huggingface.co/black-forest-labs/FLUX.1-schnell