ready = ->

  user_id = $("#user").val()

  App.notification = App.cable.subscriptions.create { channel: "NotificationChannel", user: user_id },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log 132
      alert data['message']

    invite: (room, owner, hr) ->
      @perform 'invite', room: room, owner: owner, hr: hr

  $('.invite-link').off 'click'
  $('.invite-link').on 'click', (event) ->
    event.preventDefault()
    hr_id = $(event.currentTarget).data().id
    room_id = $("#room").val()
    App.notification.invite(room_id, user_id, hr_id)
    $(event.currentTarget).hide()

$(document).on('turbolinks:load', ready)