.PHONY: all

all: install serve

install:
	# May need to run "bundle add webrick" on newer ruby
	bundle install --path vendor/bundle

serve:
	bundle exec jekyll server
