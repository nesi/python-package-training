.PHONY: all

all: install serve

install:
	# bundle add webrick
	bundle install --path vendor/bundle

serve:
	bundle exec jekyll server