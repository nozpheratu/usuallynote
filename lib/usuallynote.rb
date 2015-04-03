require 'usuallynote/configuration'
require 'usuallynote/connection'
require 'usuallynote/application'
require 'usuallynote/note'
require 'usuallynote/notebook'

module UsuallyNote
  attr_accessor :configuration, :connection
  
  class << self
    def reset
      @configuration = Configuration.new
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def connection
      @connection ||= Connection.new(auth_token: configuration.auth_token)
    end

    def start
      Application.new
    end
  end
end
