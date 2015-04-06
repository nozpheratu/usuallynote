module UsuallyNote
  module EDAMDelegatable
    def delegate_to_edam(*methods)
      methods.each do |m|
        define_method m do
          edam_object.send(m)
        end
      end
    end
  end
end
