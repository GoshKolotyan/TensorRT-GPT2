.PHONY: build run-container jupyter

build:
	docker build -t torch_tensorrt -f ./docker/Dockerfile .

run-container:
	docker run --gpus=all --rm -it \
		-v $(PWD):/Torch-TensorRT \
		--net=host \
		--ipc=host \
		--ulimit memlock=-1 \
		--ulimit stack=67108864 \
		torch_tensorrt:latest bash

jupyter:
	docker run --gpus=all --rm -it \
		-v $(PWD):/Torch-TensorRT \
		--net=host \
		--ipc=host \
		--ulimit memlock=-1 \
		--ulimit stack=67108864 \
		torch_tensorrt:latest \
		bash -c "cd /Torch-TensorRT/notebooks && jupyter notebook --allow-root --ip 0.0.0.0 --port 8888"