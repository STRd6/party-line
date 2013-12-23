WebSocketServer = require('ws').Server

wss = new WebSocketServer({port: 8080})

wss.broadcast = (data) ->
  @clients.forEach (client) ->
    client.send(data)
