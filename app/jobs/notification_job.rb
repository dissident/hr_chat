class NotificationJob < ApplicationJob
  queue_as :default

  def perform(room, owner, hr)
    add_allowed_to_room(room, hr)
    send_notification(room, owner, hr)
  end


  private

  def add_allowed_to_room(room, hr)
    room = User.find(room)
    room.allowed = room.allowed.to_a << hr
    room.save
  end

  def send_notification(room, owner, hr)
    owner = User.find(owner)
    room = User.find(room)
    ActionCable.server.broadcast "notification_#{hr}", message: "#{owner.email} invite you to chat with #{room.email}"
  end
end
