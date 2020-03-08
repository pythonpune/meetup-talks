DIR ?= $(shell date "+%Y/%B")

event_entry:
	@echo "Creating summary and newsletter files for '$(DIR)'."
	mkdir --parents $(DIR)
	cp --no-clobber templates/README.md $(DIR)
	cp --no-clobber templates/community_news.md $(DIR)
