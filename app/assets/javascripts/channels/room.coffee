ready = ->

  if window.location.pathname.split( '/' )[1] == 'rooms'

    user_id = $("#user").val()
    room_id = $("#room").val()

    App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: room_id, user: user_id },

      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        unless data['error']? && data['error'].length > 0
          $('.messages').append data['message']
        else
          console.log(data['error'])

      speak: (message) ->
        @perform 'speak', message: message

    $('#chat-speak').off 'keypress'
    $(document).on 'keypress', '#chat-speak', (event) ->
      if event.keyCode is 13
        App.room.speak(event.target.value)
        event.target.value = ""
        event.preventDefault()


$(document).on('turbolinks:load', ready)