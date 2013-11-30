Inspired on another gem - https://github.com/bloomrain/google_tts - this library is a
complete refactoring to support large texts.

#Install on Gemfile
    gem 'google_tts2', '0.0.2', :git  => "https://github.com/filipesperandio/google_tts2.git"
#Usage
    require 'google_tts'
    google_tts = GoogleTts.instantiate({:lang => :pt, :output => "out", :proxy => {:port => 8080, :host => 'localhost' }})
    google_tts.save "FileName" "Texto em Portugês"


#Development

Just install the bundles:

    bundle install

To run the tests

    bundle exec guard
    
or

    bundle exec rspec spec

