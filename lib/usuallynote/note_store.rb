module UsuallyNote
  class NoteStore
    extend EDAMDelegatable
    attr_reader :edam_object
    def initialize(user_store:, auth_token:)
      noteStoreUrl = user_store.getNoteStoreUrl(auth_token)
      noteStoreTransport = Thrift::HTTPClientTransport.new(noteStoreUrl)
      noteStoreProtocol = Thrift::BinaryProtocol.new(noteStoreTransport)
      @edam_object = Evernote::EDAM::NoteStore::NoteStore::Client.new(noteStoreProtocol)
    end

    def method_missing(method_name, *args, &block)
      edam_object.send(method_name, *args, &block)
    end
  end
end
