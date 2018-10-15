class MessagesController < ApplicationController
  def send_message
    if params[:to].present?
      create_messages_from_hash
      MessagesDeliveringJob.set(wait_until: params[:start].to_datetime, retry: false).perform_later(@messages)
      render json: { status: 'Message successfully sent.' }
    else
      render json: { errors: 'No recipient was received' }
    end
  end

  private
  def message_params
    params.require(:message).permit(:from, :body, :start, to: {})
  end

  def create_messages_from_hash
    params[:to].to_enum.each do |key, value|
      msg = @current_user.messages.build(message_params)
      msg.to, msg.messenger = key, value
      if msg.valid? && msg.save
        @messages = [] << msg
      end
    end
  end
end
