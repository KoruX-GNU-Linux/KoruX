ifneq ($(shell id -u),0)
$(error Please run make via sudo!)
endif

build:
	lb clean
	lb config
	lb build
