IMAGE = digitronik/mdchecks:latest
# FILES =$(shell git ls-files -mo | grep '\.md' | tr '\n' '\0' | xargs -0)
FILES = $(git diff --name-only HEAD $(git merge-base HEAD $TRAVIS_BRANCH))

help:
	@echo links: Check link status
	@echo lint: Check markdown rules

.DEFAULT_GOAL := help

pull:
	@echo "Pulling LaTeX docker image..."
	docker pull ${IMAGE}

links:
	@echo "link checks"
	@exec docker run --rm -iv "${PWD}":/home/node "${IMAGE}" mdcheckr "${FILES}"

lint:
	@echo "lint checks"
	@exec docker run --rm -iv "${PWD}":/home/node "${IMAGE}" markdownlint ${FILES}