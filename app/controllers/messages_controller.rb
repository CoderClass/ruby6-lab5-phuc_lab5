class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_back(fallback_location: messages_path)
    else
      flash[:error] = 'Errors: #{@message.errors.full_messages.to_sentence}'
      redirect_back(fallback_location: messages_path)
    end
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
