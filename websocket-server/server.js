const WebSocket = require('ws')

const server = new WebSocket.Server({ port: 52452 });

console.log(server);

server.on('connection', ws => {
    try {
        ws.on('message', message => {
            console.log(JSON.parse(message));

            let messageJson = {};

            if (JSON.parse(message).message)
                messageJson['message'] = JSON.parse(message).message;

            if (JSON.parse(message).image)
                messageJson['image'] = JSON.parse(message).image;

            if (messageJson) {
                var formdata = new FormData();
                formdata.append("messageJson", JSON.stringify(messageJson));
                formdata.append("user_id", JSON.parse(message).user_id);
                formdata.append("chat_id", JSON.parse(message).chat_id);
                
                var requestOptions = {
                  method: 'POST',
                  body: formdata,
                  redirect: 'follow'
                };
                
                fetch("http://diplom.vn-developer.ru/api/chat/send-message", requestOptions)
                    .then(response => response.json())
                    .then(result => console.log(result))
                    .catch(error => console.log('error', error));
                server.clients.forEach(client => {
                    if(client.readyState === WebSocket.OPEN) {
                        let sendJson = messageJson;
                        sendJson['user_id'] = JSON.parse(message).user_id;
                        sendJson['chat_id'] = JSON.parse(message).chat_id;
                        client.send(JSON.stringify(sendJson));
                    }
                });
            }
        })
    } catch (e) {
        console.log(e.toString());
    }
    console.log('User Connected')
});