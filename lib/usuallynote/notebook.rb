module UsuallyNote
  class Notebook
    class << self
      def all
        UsuallyNote.connection.notestore.listNotebooks(UsuallyNote.connection.auth_token)
      end
    end
  end
end
