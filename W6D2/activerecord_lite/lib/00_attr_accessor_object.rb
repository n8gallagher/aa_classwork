class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) do
        "value of @#{name}"
        
      end

      define_method("#{name}=") do
        
      end

    end
  end
end
