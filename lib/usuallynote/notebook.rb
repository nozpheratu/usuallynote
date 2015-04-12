module UsuallyNote
  # A simple utility class for wrapping Evernote Notebook API
  class Notebook
    extend UsuallyNote::EDAMDelegatable

    attr_reader :edam_object

    delegate_to_edam :name

    def initialize(edam_object)
      @edam_object = edam_object
    end

    def update
      auth_token = UsuallyNote.connection.auth_token
      UsuallyNote.note_store.updateNotebook(auth_token, edam_object)
    end

    def delete
      auth_token = UsuallyNote.connection.auth_token
      UsuallyNote.note_store.expungeNotebook(auth_token, edam_object.guid)
    end

    class << self
      def all
        auth_token = UsuallyNote.connection.auth_token
        UsuallyNote.note_store.listNotebooks(auth_token).map do |edam_object|
          new(edam_object)
        end
      end

      def create(name:)
        notebook = Evernote::EDAM::Type::Notebook.new
        notebook.name = name
        auth_token = UsuallyNote.connection.auth_token
        edam_object = UsuallyNote.note_store.createNotebook(auth_token, notebook)
        new(edam_object)
      end
    end
  end
end
