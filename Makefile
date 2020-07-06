HUGO ?= hugo
DATE_DIR ?= $(shell date "+%Y/%B")
DIR = content/$(DATE_DIR)

newsletter:
	@echo "Creating newsletter files in '$(DIR)'."
	mkdir --parents $(DIR)
	$(HUGO) new $(DIR)/community_news.md --kind "newsletter"

event:
	@echo "Creating summary files in '$(DIR)'."
	mkdir --parents $(DIR)
	$(HUGO) new $(DIR)/README.md --kind "event"

server:
	$(HUGO) server -D
