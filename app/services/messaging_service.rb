module MessagingService
  class << self
    def send_messages(messages)
      messages.each do |msg|
        if msg.delivered?
          p 'Message already delivered'
        else
          send("send_through_#{msg.messenger}", msg)
        end
      end
    end

    def send_through_viber(message)
      p "Sending #{message.body} to #{message.to} from #{message.user.email} via viber"
      toggle_delivered(message)
    end

    def send_through_telegram(message)
      p "Sending #{message.body} to #{message.to} from #{message.user.email} via telegram"
      toggle_delivered(message)
    end

    def send_through_whatsapp(message)
      p "Sending #{message.body} to #{message.to} from #{message.user.email} via whatsapp"
      toggle_delivered(message)
    end

    def toggle_delivered(message)
      message.touch(:delivered)
    end
  end
end