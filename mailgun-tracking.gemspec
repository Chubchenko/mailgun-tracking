# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mailgun/tracking/version'

Gem::Specification.new do |spec|
  spec.name          = 'mailgun-tracking'
  spec.version       = Mailgun::Tracking::Version
  spec.authors       = ['Artem Chubchenko']
  spec.email         = ['artem.chubchenko@gmail.com']

  spec.summary       = 'Integration with Mailgun Webhooks'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/chubchenko/mailgun-tracking'
  spec.license       = 'MIT'

  spec.files         = Dir['{lib}/**/*']
  spec.test_files    = Dir['{spec}/**/*']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4.0'

  spec.add_dependency 'rack', '>= 1.6.0'

  spec.add_development_dependency 'appraisal', '~> 2.2'
  spec.add_development_dependency 'bundler', '>= 1.16.0', '< 3.0'
  spec.add_development_dependency 'rack-test', '~> 0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rubocop', '~> 0.76.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.36'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
end
