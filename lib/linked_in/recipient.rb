module LinkedIn
  class Recipient
    include ROXML
    xml_convention {|val| val.gsub("_","-") }
    xml_reader :person, :as => Person
    
    def initialize(id)
      @person = Person.new(id)
    end
  end
end
