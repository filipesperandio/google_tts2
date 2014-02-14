# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_tts'

Gem::Specification.new do |gem|
  gem.name          = "google_tts2"
  gem.version       = GoogleTts::VERSION
  gem.authors       = ["Filipe Esperandio"]
  gem.email         = ["filipesperandio@gmail.com"]
  gem.summary       = %q{Google TTS client}
  gem.description   = %q{Google TTS client which accepts large text input, parses and split into multiple requests. Saves a single mp3 matching the input text.}
  gem.homepage      = "http://github.com/filipesperandio/google_tts2"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'rspec'
  gem.add_runtime_dependency 'nokogiri'
end
