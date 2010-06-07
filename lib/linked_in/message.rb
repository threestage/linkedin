module LinkedIn
  class Message
    include ROXML
    xml_convention {|val| val.gsub("_","-") }
    xml_name 'mailbox-item'
    xml_reader :recipients, :as => [Recipient], :in => "recipients"
    xml_reader :subject
    xml_reader :body
    
    def initialize(recipient_ids, subject, body, include_self = false)
      if recipient_ids.is_a?(Array)
        @recipients = recipient_ids.collect{|recipient_id| Recipient.new(recipient_id)}
      else
        @recipients = [Recipient.new(recipient_ids)]
      end
      
      @recipients << Recipient.new('~') if include_self
      @subject = subject
      @body = body
    end
  end
end
