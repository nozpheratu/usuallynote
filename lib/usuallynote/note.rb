module UsuallyNote
  class Note
    class << self
      def create
        self.new
      end

      def find(guid, include_content:)
        auth_token = UsuallyNote.connection.auth_token
        UsuallyNote.note_store.getNote(auth_token, guid, include_content, true, true, true)
      end
    end
  end
end
