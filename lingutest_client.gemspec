# frozen_string_literal: true

require_relative './lib/lingutest_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'lingutest_client'
  spec.version       = LingutestClient::VERSION
  spec.authors       = ['Anatolii Didukh']
  spec.email         = ['railsme7@gmail.com']

  spec.summary       = 'Write a short summary, because RubyGems requires one.'
  spec.description   = 'Write a longer description or delete this line.'
  # spec.homepage      = "Put your gem's website or public repo URL here."
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.6')

  spec.metadata['rubygems_mfa_required'] = 'true'
  # spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'dry-configurable', '~> 0.13.0'
  spec.add_dependency 'dry-schema', '~> 1.10.0'
  spec.add_dependency 'dry-struct', '~> 1.5.0'
  spec.add_dependency 'dry-types', '~> 1.6.0'

  spec.add_dependency 'faraday', '~> 1.10.0'
  spec.add_dependency 'faraday_middleware', '~> 1.2.0'
  spec.add_development_dependency 'rubocop', '~> 1.43.0'
end
