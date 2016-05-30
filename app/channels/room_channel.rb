# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel

  def subscribed
    stream_from "room_#{params[:room]}"
    stream_from "user_#{params[:user]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    SendMessagesJob.perform_later(data['message'], params[:room], params[:user])
  end

end
