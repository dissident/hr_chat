class SendMessagesJob < ApplicationJob

  queue_as :default

  def perform(message, room, user)
    object = Message.new({
      text: message,
      room_id: room,
      owner_id: user
    })
    if object.save
      ActionCable.server.broadcast "room_#{room}", message: render_message(object)
    else
      ActionCable.server.broadcast "user_#{user}", error: "Error Message"
    end
  end

  private

  def render_message(object)
    RoomsController.render(partial: 'messages/message', locals: { message: object })
  end

end
