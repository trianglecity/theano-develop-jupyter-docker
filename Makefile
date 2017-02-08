##
## This Makefile is based on the work of https://docs.docker.com/opensource/project/set-up-dev-env/
## Please refer to https://docs.docker.com/opensource/project/set-up-dev-env/ for more information.
##

.PHONY: all  build  run shell test 

# set the graph driver as the current graphdriver if not set
DOCKER_GRAPHDRIVER := $(if $(DOCKER_GRAPHDRIVER),$(DOCKER_GRAPHDRIVER),$(shell docker info 2>&1 | grep "Storage Driver" | sed 's/.*: //'))
export DOCKER_GRAPHDRIVER
DOCKER_INCREMENTAL_BINARY := $(if $(DOCKER_INCREMENTAL_BINARY),$(DOCKER_INCREMENTAL_BINARY),1)
export DOCKER_INCREMENTAL_BINARY


DOCKERFILE := Dockerfile


DOCKER_ENVS := \
	-e BUILD_APT_MIRROR \
	-e BUILDFLAGS \
	-e KEEPBUNDLE \
	-e DOCKER_GRAPHDRIVER \
	-e DOCKER_INCREMENTAL_BINARY 


BIND_DIR := $(if $(BIND_DIR),$(BIND_DIR),$(if $(DOCKER_HOST),,host_develop))
export BIND_DIR


DOCKER_DIR_GENERATE := $(if $(BIN_DDIR),-v "/home/develop/$(BIND_DIR)")
DOCKER_MOUNT := $(if $(BIND_DIR),-v "$(CURDIR)/$(BIND_DIR):/home/develop/$(BIND_DIR)")


DOCKER_MOUNT := $(if $(DOCKER_MOUNT),$(DOCKER_MOUNT),-v "/home/develop/$(BIND_DIR)")

# This allows to set the theano-dev container name
DOCKER_CONTAINER_NAME := $(if $(CONTAINER_NAME),--name $(CONTAINER_NAME),)


DOCKER_FLAGS := docker run --rm -i -p 8888:8888  --privileged $(DOCKER_CONTAINER_NAME) $(DOCKER_ENVS) $(DOCKER_DIR_GENERATE) $(DOCKER_MOUNT) 
BUILD_APT_MIRROR := $(if $(DOCKER_BUILD_APT_MIRROR),--build-arg APT_MIRROR=$(DOCKER_BUILD_APT_MIRROR))
export BUILD_APT_MIRROR


INTERACTIVE := $(shell [ -t 0 ] && echo 1 || echo 0)
ifeq ($(INTERACTIVE), 1)
	DOCKER_FLAGS += -t
endif

UBUNTU_IMAGE := theano-dev-jupyter:01
DOCKER_RUN_DOCKER := $(DOCKER_FLAGS) "$(UBUNTU_IMAGE)"

TARGET_PATH :=$(CURDIR)



default: install_theano

all: build ## 
	$(DOCKER_RUN_DOCKER) bash -c 'ls -al && /home/develop/python setup.py develop'

install_theano: build ## 
	$(DOCKER_RUN_DOCKER) bash -c 'ls -al && /home/develop/python setup.py develop'

build: notebook
	docker build ${BUILD_APT_MIRROR} ${DOCKER_BUILD_ARGS} -t "$(UBUNTU_IMAGE)" -f "$(DOCKERFILE)" .

notebook:
	mkdir notebook

run: build ## run the docker daemon in a container
	$(DOCKER_RUN_DOCKER) sh -c "ls -al "

shell: build ## install python setup.py develop
	$(DOCKER_RUN_DOCKER) bash 
	
test: notebook
	@echo $(BIND_DIR)
	





