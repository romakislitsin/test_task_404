class MessagesDeliveringJob < ApplicationJob
  queue_as :default

  def perform(messages)
    MessagingService.send_messages(messages)
  end
end
