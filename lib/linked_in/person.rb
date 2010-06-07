module LinkedIn
  class Person
    include ROXML
    xml_convention {|val| val.gsub("_","-") }
    xml_reader :path, :from => "@path"
    
    def initialize(id)
      @path = "/people/#{id.to_s}"
    end
  end
end
