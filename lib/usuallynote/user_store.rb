module UsuallyNote
  class UserStore

    attr_reader :edam_object

    def initialize
      evernoteHost = 'sandbox.evernote.com'
      userStoreUrl = "https://#{evernoteHost}/edam/user"
      userStoreTransport = Thrift::HTTPClientTransport.new(userStoreUrl)
      userStoreProtocol = Thrift::BinaryProtocol.new(userStoreTransport)
      @edam_object = Evernote::EDAM::UserStore::UserStore::Client.new(userStoreProtocol)
    end
  end
end
