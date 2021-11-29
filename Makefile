install:
	bundle install

linter_run:
	bundle exec rubocop

test:
	bundle exec rspec
