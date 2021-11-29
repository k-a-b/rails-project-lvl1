# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name          = 'hexlet_code'
  spec.version       = HexletCode::VERSION
  spec.authors       = ['a.karashkevich']
  spec.email         = ['k-ar-b@ya.ru']

  spec.summary       = 'simple form generator'
  spec.description   = 'simple form generator'
  spec.homepage      = 'https://github.com/k-a-b/rails-project-lvl1.git'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0.2')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/k-a-b/rails-project-lvl1.git'
  spec.metadata['changelog_uri'] = 'https://github.com/k-a-b/rails-project-lvl1.git/CHANGELOG.md'

  spec.files = Dir['{config,db,lib}/**/*', 'LICENSE.txt', 'Rakefile', 'README.md']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency 'rspec-html-matchers'
end
