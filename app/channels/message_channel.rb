class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_#{params[:conversation_id]}"
  end
end
