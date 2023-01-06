'use strict'

const jwt = require('jsonwebtoken')
const response = require('../response')
const db = require('../Database/database')

exports.createChat = async (req, res) => {
    try {
        var tokenPayload = jwt.decode(req.headers.authorization.replace('Bearer ',''));
        if (tokenPayload) {
            db.query(`INSERT INTO chats (first_id, second_id) VALUES (${tokenPayload.user_id}, ${req.body.id})`, (error, rows, fields) => {
                if(error) {
                    response.send(400, error, res)
                } else {
                    response.send(200, rows, res)
                }
            })
        } else response.send(400, {message: `Требуется токен`}, res)
    } catch (e) {response.send(400, e.toString(), res)}
}

exports.getChats = async (req, res) => {
    try {
        var tokenPayload = jwt.decode(req.headers.authorization.replace('Bearer ',''));
        if (tokenPayload) {
            db.query(`SELECT * FROM chats WHERE first_id = ${tokenPayload.user_id} OR second_id = ${tokenPayload.user_id}`, (error, rows, fields) => {
                if(!error) {
                    if (rows.length > 0) {
                        var chatRows = rows;
                        var chatIterator = 0;
                        chatRows.forEach((chat, index) => {
                            let fid = chat.first_id;
                            let sid = chat.second_id;

                            if (tokenPayload.user_id == sid)
                                [fid, sid] = [sid, fid];
                            
                            db.query(`SELECT id, login, phone, profile_picture FROM users WHERE id = ${fid} LIMIT 1`,  (error, rows, fields) => {
                                chatRows[index]['creator'] = rows[0];
                                db.query(`SELECT id, login, phone, profile_picture FROM users WHERE id = ${sid} LIMIT 1`,  (error, rows, fields) => {
                                    chatIterator++;
                                    chatRows[index]['interlocutor'] = rows[0];
                                    delete chatRows[index].first_id;
                                    delete chatRows[index].second_id;
                                    if (chatIterator === chatRows.length) {
                                        response.send(200, chatRows, res);
                                    }
                                })
                            })
                        });
                    } else {
                        response.send(200, {message: "У вас нет чатов"}, res);
                    }
                } else {
                    response.send(400, error, res)
                }
            })
        } else response.send(400, `Требуется токен`, res)
    } catch (e) {response.send(400, e.toString(), res)}
}