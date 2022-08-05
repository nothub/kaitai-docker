DOCKER = docker
TAG = n0thub/kaitai:dev

default: build run

build:
	$(DOCKER) build --tag "$(TAG)" .

run:
	$(DOCKER) run --interactive --tty --rm "$(TAG)"

clean:
	-$(DOCKER) stop $(TAG)
	-$(DOCKER) rm -f $(TAG)
	-$(DOCKER) rmi -f $(TAG)

.PHONY: default build run clean
