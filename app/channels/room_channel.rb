# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel

  def subscribed
    p @params
    stream_from "room_#{params[:room]}"#"room_chanel_#{room.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)

    ActionCable.server.broadcast "room_#{params[:room]}", message: data['message']
  end

  private

  def send_message(room, message)
    ActionCable.server.broadcast "room_#{room}", message: message
  end

end
