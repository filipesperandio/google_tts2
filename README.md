#Install on Gemfile
    gem 'google_tts2', '0.0.2', :git  => "https://github.com/filipesperandio/google_tts2.git"
#Usage
    require 'google_tts'
    google_tts = GoogleTts::Client.new
    google_tts.save "FileName" "Texto em Portugês"

#TODO
* Builder for any language
* gemspec

#Development

Just install the bundles:

    bundle install

To run the tests

    bundle exec guard
    
or

    bundle exec rspec spec

