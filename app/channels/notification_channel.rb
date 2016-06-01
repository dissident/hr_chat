# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_#{params[:user]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def invite(data)
    NotificationJob.perform_later(data['room'], params[:user], data['hr'])
  end
end
