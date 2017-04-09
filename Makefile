.PHONY: test
deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt
lint:
	flake8 hello_world test
docker_build:
	docker build  -t .hello-world-printer .

docker_run: docker_build
	docker run \
	--name hello-world-printer-dev \
	-p 5000:5000 \
	-d hello-world-printer

USERNAME=maciejwsb
TAG=$ (USERNAME) /hello-world-printer
docker_push:
	@docker login --username $(USERNAME) --password $(PASSWORD) ; \
	docker tag hello-world-printer $ (TAG); \
	docker push $(TAG); \
	docker logout;
