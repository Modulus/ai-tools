
# THis seems a good choice over automatic regarding docker setup

https://github.com/invoke-ai/InvokeAI/blob/main/docker/docker-compose.yml


## Run on AMD GPU
docker pull ghcr.io/invoke-ai/invokeai:main-rocm


## RUN IT
docker run --runtime=nvidia --gpus=all --publish 9090:9090 ghcr.io/invoke-ai/invokeai

Then open http://localhost:9090 and install some models using the Model Manager tab to begin generating.

For ROCm, add --device /dev/kfd --device /dev/dri to the docker run command.


docker run --device /dev/kfd --device /dev/dri --publish 9090:9090 ghcr.io/invoke-ai/invokeai:main-rocm

docker run --volume /some/local/path:/invokeai {...etc...}


docker run  --volume ~/invokeai:/invokeai --device /dev/kfd --device /dev/dri --publish 9090:9090 ghcr.io/invoke-ai/invokeai:main-rocm

### Docker-compose
docker-compose --profile rocm up -d