WebSocketServer = require('ws').Server

wss = new WebSocketServer({port: process.env.PORT})

wss.on 'connection', (ws) ->
  ws.on 'message', (message) ->
    console.log('received: %s', message)

    wss.broadcast message

wss.broadcast = (data) ->
  @clients.forEach (client) ->
    client.send(data)
