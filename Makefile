SHELL := /bin/bash
DOCKER_COMPOSE := docker compose
CONTAINER := jekyll

# Function to check if the container is running
IS_RUNNING := $(shell $(DOCKER_COMPOSE) ps -q $(CONTAINER))

help: ## Show this help message
	@echo "Available targets:"
	@echo "=================="
	@grep -E '(^[a-zA-Z_-]+:.*?## .*$$|^# Section: )' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; \
		     /^# Section:/ {gsub("^# Section: ", ""); print "\n\033[1;35m" $$0 "\033[0m"}; \
		     /^[a-zA-Z_-]+:/ {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

attach: ## Attach to the container
ifeq ($(IS_RUNNING),)
	@$(DOCKER_COMPOSE) up -d
endif
	@$(DOCKER_COMPOSE) exec -it $(CONTAINER) bash
ifeq ($(IS_RUNNING),)
	@$(MAKE) teardown
endif

serve: ## Start the development server
ifeq ($(IS_RUNNING),)
	@$(DOCKER_COMPOSE) up -d
endif
	-@$(DOCKER_COMPOSE) exec $(CONTAINER) bash -c "bundle exec jekyll serve --watch --host 0.0.0.0"
ifeq ($(IS_RUNNING),)
	@$(MAKE) teardown
endif

build: ## One off build
ifeq ($(IS_RUNNING),)
	@$(DOCKER_COMPOSE) up -d
endif
	-@$(DOCKER_COMPOSE) exec $(CONTAINER) bash -c "bundle exec jekyll build"
ifeq ($(IS_RUNNING),)
	@$(MAKE) teardown
endif

clean: ## Clean up the site
ifeq ($(IS_RUNNING),)
	@$(DOCKER_COMPOSE) up -d
endif
	-@$(DOCKER_COMPOSE) exec $(CONTAINER) bash -c "bundle exec jekyll clean"
ifeq ($(IS_RUNNING),)
	@$(MAKE) teardown
endif

fix-host: ## Fix the static file host
ifeq ($(IS_RUNNING),)
	@$(DOCKER_COMPOSE) up -d
endif
	-@$(DOCKER_COMPOSE) exec $(CONTAINER) bash -c "bundle exec jekyll clean"
	-@$(DOCKER_COMPOSE) exec $(CONTAINER) bash -c "bundle exec jekyll build --config _config.yml,_config.dev.yml"
ifeq ($(IS_RUNNING),)
	@$(MAKE) teardown
endif

docker_build: ## Build Docker images
	@$(DOCKER_COMPOSE) build

chownme: ## Change ownership of files to current user
	@sudo chown -R $(shell whoami) ./

teardown: ## Stop Docker containers and clean up
	@$(DOCKER_COMPOSE) down -t 1
