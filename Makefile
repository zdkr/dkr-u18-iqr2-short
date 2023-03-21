######################################################################
# to see the commands of a target run make target V=s (Verbose=Set)
# otherwise make target does not print/show the commands under target
$(V).SILENT:

######################################################################
export IMG=u18iqr2
export CONT=u18iqr2c
export HOST=u18iqr2h
export VOLP=${PWD}
export DEV_USER=dev
export VER=v5.0.0

######################################################################
export DOCKER_PATH=${DOCKER_ID}/${IMG}:${VER}

######################################################################
build: stop
	docker build -t $${IMG} \
	--build-arg DEV_USER=${DEV_USER} \
	--no-cache .

tag:
	docker tag $${IMG}:latest $${DOCKER_PATH}

push: tag
	#docker login -u="$${DOCKER_ID}" -p="$${DOCKER_PASS}"
	echo "$${DOCKER_PASS}" | docker login -u="$${DOCKER_ID}" --password-stdin
	docker image push $${DOCKER_PATH}

run: stop
	#mkdir -p $${VOLP}
	docker run -it --rm \
	-v $${VOLP}:/home/$${DEV_USER}/work \
	-h $${HOST} \
	--name $${CONT} $${DOCKER_PATH}

stop:
	docker ps -q --all --filter "name=$${CONT}" | grep -q . && docker stop $${CONT} && docker rm -fv $${CONT} || true

test:
	echo "$${IMG}"
	echo "$${CONT}"	
	echo "$${HOST}"
	echo "$${VOLP}"
	echo "$${DEV_USER}"
	echo "$${VER}"
	echo "$${DOCKER_PATH}"
	echo "$$USER"

