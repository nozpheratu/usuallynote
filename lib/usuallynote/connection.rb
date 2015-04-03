require 'evernote-thrift'

module UsuallyNote
  class Connection
    attr_accessor :notestore, :auth_token
    def initialize(auth_token:)
      @auth_token = auth_token
      evernoteHost = "sandbox.evernote.com"
      userStoreUrl = "https://#{evernoteHost}/edam/user"
      userStoreTransport = Thrift::HTTPClientTransport.new(userStoreUrl)
      userStoreProtocol = Thrift::BinaryProtocol.new(userStoreTransport)
      userStore = Evernote::EDAM::UserStore::UserStore::Client.new(userStoreProtocol)
      noteStoreUrl = userStore.getNoteStoreUrl(auth_token)
      noteStoreTransport = Thrift::HTTPClientTransport.new(noteStoreUrl)
      noteStoreProtocol = Thrift::BinaryProtocol.new(noteStoreTransport)
      @notestore = Evernote::EDAM::NoteStore::NoteStore::Client.new(noteStoreProtocol)
    end
  
    def userstore
    end    

    def notebooks
    end
  end
end
