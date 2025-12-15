# TensorRT-GPT2

Running GPT-2 with TensorRT optimization for accelerated inference.

## Prerequisites

- Docker with NVIDIA Container Toolkit
- NVIDIA GPU with CUDA support

## Quick Start

### 1. Clone Torch-TensorRT

```bash
git clone https://github.com/NVIDIA/Torch-TensorRT
cd Torch-TensorRT
```

### 2. Build and Run Docker Container

```bash
docker build -t torch_tensorrt -f ./docker/Dockerfile .
```

```bash
docker run --gpus=all --rm -it \
    -v $PWD:/Torch-TensorRT \
    --net=host \
    --ipc=host \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    torch_tensorrt:latest bash
```

### 3. Launch Jupyter Notebook

Inside the container:

```bash
cd /Torch-TensorRT/notebooks
jupyter notebook --allow-root --ip 0.0.0.0 --port 8888
```

Then open `http://localhost:8888` in your browser.
