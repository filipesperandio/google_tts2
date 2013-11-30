Inspired on another gem - https://github.com/bloomrain/google_tts - this library is a
complete refactoring to support large texts.

#Install 
on Gemfile

    gem 'google_tts2'

or just

    gem install google_tts2
    

#Usage
    require 'google_tts'
    google_tts = GoogleTts.instantiate
    google_tts.save("FileName", "English text")
    # => "out/FileName.mp3" 

or

    google_tts = GoogleTts.instantiate({:lang => :pt, :output => "tmp/mp3"})
    google_tts.save("FileName", File.open("big_text_file.txt").read)
    # => "tmp/mp3/FileName.mp3" 

or

    google_tts = GoogleTts.instantiate({:lang => :pt, :output => "out", :proxy => {:port => 8080, :host => 'localhost' }})
    google_tts.save("FileName", "Texto em Portugês")
    # => "out/FileName.mp3" 


#Development

Just install the bundles:

    bundle install


To run the tests

    bundle exec guard

or

    bundle exec rspec spec

