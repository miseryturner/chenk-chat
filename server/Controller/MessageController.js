'use strict'

const jwt = require('jsonwebtoken')
const response = require('../response')
const db = require('../Database/database')
const config = require('./../configuration')

function isExt(filename, extensions) {
    var i = filename.lastIndexOf('.');
    return (i < 0) ? false : (extensions.includes(filename.substr(i)));
}

function makeid(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

exports.getMessages = async (req, res) => {
    try {
        var tokenPayload = jwt.decode(req.headers.authorization.replace('Bearer ',''));
        if (tokenPayload) {
            db.query(`SELECT first_id, second_id FROM chats WHERE id = ${req.query.id}`, (error, rows, fields) => {
                if(!error) {
                    if (tokenPayload.user_id == rows[0].first_id || tokenPayload.user_id == rows[0].second_id) {
                        db.query(`SELECT * FROM messages WHERE chat_id = ${req.query.id}`, (error, rows, fields) => {
                            if(error) {
                                response.send(400, error, res)
                            } else {
                                response.send(200, rows, res)
                            }
                        })
                    } else response.send(400, {message: "Вас нет в этом чате"}, res)
                } else response.send(400, error, res)
            })
        } else response.send(400, {message: `Требуется токен`}, res)
    } catch (e) {response.send(400, e.toString(), res)}
}

exports.test = async (req, res) => {
    // db.query(`SELECT * FROM messages`, (error, rows, fields) => {
    //     if(error) {
    //         response.send(400, error, res)
    //     } else {
    //         response.send(200, rows, res)
    //     }
    // })
    fetch('https://jsonplaceholder.typicode.com/todos/1')
      .then(result => result.json())
      .then(json => res.send(json))
}

exports.sendMessage = async (req, res) => {
    const messageJson = req.body.messageJson
    const user_id = req.body.user_id
    const chat_id = req.body.chat_id

    const sql = `INSERT INTO messages (text, from_user_id, chat_id) VALUES ('${messageJson}', '${user_id}', '${chat_id}')`;
    db.query(sql, (error, results) => {
        if(error) {
            response.send(400, error, res)
        } else {
            response.send(200, {message: `Сообщение добавлено`, results}, res)
        }
    })
}

exports.appendImage = async (req, res) => {
    try {
        var tokenPayload = jwt.decode(req.headers.authorization.replace('Bearer ',''));
        if (tokenPayload) {
            if (req.files) {
                if (Object.prototype.hasOwnProperty.call(req.files, 'image')) {
                    if (req.files.image.size <= config.UPLOAD_MAX_PICTURE_SIZE) {
                        if (isExt(req.files.image.name.toLowerCase(), ['.jpg', '.jpeg', '.png'])) {
                            let picbuff = Buffer.from((makeid(32) + tokenPayload.user_id.toString() + req.files.image.name)).toString('base64').replace('=', '');
                            req.files.image.mv(config.PROJECT_DIR + '/Uploads/ChatImages/' + picbuff + ".png")
                                .then(() => {
                                    let filepath = '/Uploads/ChatImages/' + picbuff + ".png";
                                    response.send(200, { imgpath: filepath }, res)
                                }).catch(error => response.send(400, `Ошибка загрузки изображения [${error.message}]`, res))
                        } else response.send(400, "Формат изображения должно быть подходящим", res)
                    } else response.send(400, "Размер изображения должен быть менее 10 МБ", res)
                } else response.send(400, "Изображение должно быть загружено с атрибутом 'image'", res)
            } else response.send(400, "Вы должны загрузить изображение", res)
        } else response.send(400, `Требуется токен`, res)
    } catch (e) {response.send(400, e.toString(), res)}
}