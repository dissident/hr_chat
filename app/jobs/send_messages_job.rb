class SendMessagesJob < ApplicationJob

  queue_as :default

  def perform(message, room, user)
    object = Message.new({
      text: message,
      room_id: room,
      owner_id: user
    })
    if object.save
      ActionCable.server.broadcast "room_#{room}", message: message
    else
      ActionCable.server.broadcast "user_#{user}", error: "Error Message"
    end
  end

end
