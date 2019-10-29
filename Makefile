DOCKERFILE		:= Dockerfile
PROJECT     	:= project-chrono-vnc
ORIGIN     		:= $(shell git remote get-url origin | sed -e 's/^.*@//g')
REVISION    	:= $(shell git rev-parse --short HEAD)
DOCKERFILES 	:= $(sort $(wildcard */$(DOCKERFILE)))
USERNAME		:= naokitakahashi12

# Directory identities
BASE			:= base
IRRLICHT		:= irrlicht
PROJECTCHRONO	:= project-chrono

# Support ubuntu distributions
BIONIC			:= bionic
XENIAL			:= xenial

# Build image tag
BIONICBASE		:= $(BIONIC)-$(BASE)
BIONICIRRLICHT	:= $(BIONIC)-$(IRRLICHT)
XENIALBASE		:= $(XENIAL)-$(BASE)
XENIALIRRLICHT	:= $(XENIAL)-$(IRRLICHT)

define dockerbuild
	@docker build \
		--file $1 \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(ORIGIN) \
		--tag $2 \
	.
endef

.PHONY: build
build: $(BIONIC) $(XENIAL)

$(BIONIC): $(BIONIC)/$(PROJECTCHRONO)/$(DOCKERFILE) $(BIONICIRRLICHT)
	$(eval DOCKERIMAGE := "$(USERNAME)/$(PROJECT):$@")
	$(call dockerbuild, $<, $(DOCKERIMAGE))

$(BIONICIRRLICHT): $(BIONIC)/$(IRRLICHT)/$(DOCKERFILE) $(BIONICBASE)
	$(eval DOCKERIMAGE := "$(USERNAME)/$(PROJECT):$@")
	$(call dockerbuild, $<, $(DOCKERIMAGE))

$(BIONICBASE): $(BIONIC)/$(BASE)/$(DOCKERFILE)
	$(eval DOCKERIMAGE := "$(USERNAME)/$(PROJECT):$@")
	$(call dockerbuild, $<, $(DOCKERIMAGE))

$(XENIAL): $(XENIAL)/$(PROJECTCHRONO)/$(DOCKERFILE) $(XENIALIRRLICHT)
	$(eval DOCKERIMAGE := "$(USERNAME)/$(PROJECT):$@")
	$(call dockerbuild, $<, $(DOCKERIMAGE))

$(XENIALIRRLICHT): $(XENIAL)/$(IRRLICHT)/$(DOCKERFILE) $(XENIALBASE)
	$(eval DOCKERIMAGE := "$(USERNAME)/$(PROJECT):$@")
	$(call dockerbuild, $<, $(DOCKERIMAGE))

$(XENIALBASE): $(XENIAL)/$(BASE)/$(DOCKERFILE)
	$(eval DOCKERIMAGE := "$(USERNAME)/$(PROJECT):$@")
	$(call dockerbuild, $<, $(DOCKERIMAGE))

PHONY: clean
clean: $(BIONIC) $(BIONICIRRLICHT) $(BIONICBASE) $(XENIAL) $(XENIALIRRLICHT) $(XENIALBASE)
	@for IMAGETAG in $^; do \
		docker image rm $(USERNAME)/$(PROJECT):$$IMAGETAG; \
	done

PHONY: pull
pull: $(BIONIC) $(BIONICIRRLICHT) $(BIONICBASE) $(XENIAL) $(XENIALIRRLICHT) $(XENIALBASE)
	@for IMAGETAG in $^; do \
		docker pull $(USERNAME)/$(PROJECT):$$IMAGETAG; \
	done

