IMAGE = digitronik/mdchecks:latest
FILES =$(shell git ls-files -mo | grep '\.md' | tr '\n' '\0' | xargs -0)
TRAVIS_CHANGES = $(shell git --no-pager diff --name-only FETCH_HEAD $(shell git merge-base FETCH_HEAD master) | grep '\.md' | tr '\n' '\0' | xargs -0)

help:
	@echo links: Check link status
	@echo lint: Check lint rules

.DEFAULT_GOAL := help

pull:
	@echo "Pulling LaTeX docker image..."
	docker pull ${IMAGE}

links:
	@echo "link checks"
	@exec docker run --rm -iv "${PWD}":/home/node "${IMAGE}" mdcheckr ${FILES}

lint:
	@echo "lint checks"
	@exec docker run --rm -iv "${PWD}":/home/node "${IMAGE}" markdownlint ${FILES}

travis:
	@echo " ----------------------------- Checking links ----------------------------- "
	@exec docker run --rm -iv "${PWD}":/home/node "${IMAGE}" mdcheckr ${TRAVIS_CHANGES}
	
	@echo " --------------------------- Checking lint rules ---------------------------- "
	@exec docker run --rm -iv "${PWD}":/home/node "${IMAGE}" markdownlint ${TRAVIS_CHANGES}
