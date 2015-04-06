require 'evernote-thrift'
require 'usuallynote/edam_delegatable'
require 'usuallynote/configuration'
require 'usuallynote/user_store'
require 'usuallynote/note_store'
require 'usuallynote/connection'
require 'usuallynote/application'
require 'usuallynote/note'
require 'usuallynote/notebook'

module UsuallyNote
  attr_accessor :configuration
  
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

    def user_store
      @user_store ||= UserStore.new
    end

    def note_store
      @note_store ||= NoteStore.new(user_store: user_store.edam_object, auth_token: configuration.auth_token)
    end

    def start
      Application.new
    end
  end
end
