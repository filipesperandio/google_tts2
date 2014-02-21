NOTE: latest version is 0.1.0

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

##Auto-proxy selection
Use with caution, the selection is totally ramdom base on lists of public proxies, they may have very high latency and result on time out.
The suggestion is to use when you start receiving 302 responses from google - manually it means you face a captcha input form - because you made too many requests for the day.

    google_tts = GoogleTts.with_random_proxy.instantiate({ :output => "out", :lang => :pt })
    google_tts.save "file2", "Olá, tudo bem com você?"
    # => "out/file2.mp3" 


#Development

Just install the bundles:

    bundle install


To run the tests

    bundle exec guard

or

    bundle exec rspec spec

