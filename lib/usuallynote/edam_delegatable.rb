module UsuallyNote
  module EDAMDelegatable
    def delegate_to_edam(*methods)
      methods.each do |name|
        define_method name do
          edam_object.send(name)
        end
        define_method "#{name}=" do |value|
          edam_object.instance_variable_set("@#{name}", value)
        end
      end
    end
  end
end
