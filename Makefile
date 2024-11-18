# Variables
JEKYLL = jekyll
SITE_DIR = _site
PORT = 4000

.PHONY: default help serve build clean doctor

default: serve

# Show this help message
help:
	@cat $(MAKEFILE_LIST) | docker run --rm -i xanders/make-help

# Builds site any time a source file changes and serves it locally
serve: clean
	$(JEKYLL) serve --watch --livereload --port $(PORT) --incremental

# Performs a one off build to _site
build: clean
	$(JEKYLL) build

# Removes all generated files: destination folder, metadata file, Sass and Jekyll caches
clean:
	$(JEKYLL) clean

# Outputs any deprecation or configuration issues.
doctor:
	$(JEKYLL) doctor
