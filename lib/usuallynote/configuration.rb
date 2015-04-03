require 'dotenv'
Dotenv.load
module UsuallyNote
  class Configuration
    attr_accessor :auth_token

    def initialize
      @auth_token = ENV['EVERNOTE_SANDBOX_TOKEN']
    end
  end
end
