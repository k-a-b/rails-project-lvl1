[![Build Status](https://app.travis-ci.com/k-a-b/rails-project-lvl1.svg?branch=master)](https://app.travis-ci.com/k-a-b/rails-project-lvl1)
# HexletCode

This is simple form generator, created as study project

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

```ruby
user = User.new(name: 'rob', job: 'hexlet', gender: 'm')

HexletCode.form_for user do |f|
  # Проверяет есть ли значение внутри name
  f.input :name
  # Проверяет есть ли значение внутри job
  f.input :job, as: :text
  f.submit
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
#   <input name="commit" type="submit" value="Save" >
# </form>
```

## Development
Prerequests:
`Ruby 3.0`
`installed bundler`

After cloning the repo,
run `make install` for instal depencies.
run `make linter_run`
run `make test`
Run `bin/console` for play with app

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
