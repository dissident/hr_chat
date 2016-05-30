room_id = document.URL.split("/")[4]


App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: room_id },

  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('.messages').append "<p>#{data['message']}</p>"

  speak: (message) ->
    @perform 'speak', message: message


$(document).on 'keypress', '#chat-speak', (event) ->
  if event.keyCode is 13
    App.room.speak(event.target.value)
    event.target.value = ""
    event.preventDefault()
