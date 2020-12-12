class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    @message_log = MessageLog.new(username: data['name'],body: data['message'])
    if @message_log.save
      ActionCable.server.broadcast "chat_room_channel", message: data["message"], sent_by: data["name"]
    end
  end

  def announce(data)
    ActionCable.server.broadcast "chat_room_channel", chat_room_name: data["name"], type: data["type"]
  end
end