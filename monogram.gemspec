# frozen_string_literal: true

require_relative 'lib/monogram/version'

Gem::Specification.new do |spec|
  spec.name          = 'monogram'
  spec.version       = Monogram::VERSION
  spec.authors       = ['Matt Bearman']
  spec.email         = ['matt@mattbearman.com']

  spec.summary       = 'Creates SVG letter avatars on the fly with consistent colours.'
  spec.homepage      = 'https://github.com/mattbearman/monogram'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"

  spec.files = Dir['lib/**/*.rb', 'lib/**/*.erb']
end
