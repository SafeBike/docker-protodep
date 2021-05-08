IMAGE = safebike/protodep
TAG = latest

.PHONY: all
all: ## Build and run the example
all: build example

.PHONY: help
help: ## Show help
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: test
test: ## Check the environment variables
	@test $(IMAGE)
	@test $(TAG)

.PHONY: build
build: test ## Build Docker image
	docker build \
	--tag $(IMAGE):$(TAG) \
	.

.PHONY: example
example: test ## Get proto dependencies
	docker run --rm -v $(HOME)/.ssh:/root/.ssh -v $(PWD):/tmp -w /tmp  protodep up -f -i id_rsa

.PHONY: push
push: build ## Push image to `https://hub.docker.com`
	docker push $(IMAGE):$(TAG)