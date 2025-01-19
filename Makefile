SHELL := /bin/bash

# Common variables
DOCKER_COMPOSE := docker-compose

help: ## Show this help message
	@echo "Available targets:"
	@echo "=================="
	@grep -E '(^[a-zA-Z_-]+:.*?## .*$$|^# Section: )' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; \
		     /^# Section:/ {gsub("^# Section: ", ""); print "\n\033[1;35m" $$0 "\033[0m"}; \
		     /^[a-zA-Z_-]+:/ {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

serve: ## Start the development server
	@$(DOCKER_COMPOSE) up --build
	@$(MAKE) teardown

docker_build: ## Build Docker images
	@$(DOCKER_COMPOSE) build

chownme: ## Change ownership of files to current user
	@sudo chown -R $(shell whoami) ./

teardown: ## Stop Docker containers and clean up
	@$(DOCKER_COMPOSE) down -t 1