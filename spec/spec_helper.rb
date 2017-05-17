require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  require 'rspec'
  require "simplecov"
  SimpleCov.start

  RSpec.configure do |config|
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.run_all_when_everything_filtered = true
    config.filter_run :focus
    config.order = 'random'
  end
end

Spork.each_run do
  # automatically include all the /lib files
  lib_folder = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
  Dir["#{lib_folder}/**/*.rb"].each do |file|
    require file
  end
end
