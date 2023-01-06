'use strict'

const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

const response = require('../response')
const db = require('../Database/database')
const config = require('./../configuration')

function isExt(filename, extensions /* .exe */) {
    var i = filename.lastIndexOf('.');
    return (i < 0) ? false : (extensions.includes(filename.substr(i)));
}

exports.getAllUsers = async (req, res) => {
    try {
        db.query('SELECT id, login, profile_picture, phone FROM users', (error, rows, fields) => {
            if(error) {
                response.send(400, error, res)
            } else {
                response.send(200, rows, res)
            }
        })
    } catch (e) {response.send(400, e.toString(), res)}
}

exports.getUserById = async (req, res) => {
    try {
        db.query(`SELECT id, login, phone, profile_picture FROM users WHERE id = ${req.query.id} LIMIT 1`, (error, rows, fields) => {
            if(error) {
                response.send(400, error, res)
            } else {
                response.send(200, rows, res)
            }
        })
    } catch (e) {response.send(400, e.toString(), res)}
}

exports.getMyData = async (req, res) => {
    try {
        var tokenPayload = jwt.decode(req.headers.authorization.replace('Bearer ',''));
        db.query(`SELECT id, login, phone, profile_picture FROM users WHERE id = ${tokenPayload.user_id} LIMIT 1`, (error, rows, fields) => {
            if(error) {
                response.send(400, error, res)
            } else {
                response.send(200, rows, res)
            }
        })
    } catch (e) {response.send(400, e.toString(), res)}
}

exports.searchUser = async (req, res) => {
    try {
        db.query(`SELECT id, login, phone, profile_picture FROM users WHERE login LIKE '%${req.query.q}%' OR phone LIKE '+%${req.query.q.replace('+', '')}%'`, (error, rows, fields) => {
            if(error) {
                response.send(400, error, res)
            } else {
                response.send(200, rows, res)
            }
        })
    } catch (e) {response.send(400, e.toString(), res)}
}

exports.SignUp = async (req, res) => {
    try {
        db.query("SELECT `id` FROM `users` WHERE `phone` = '" + req.body.phone + "' OR `login` = '" + req.body.login + "'", (error, rows, fields) => {
            if (error) {
                response.send(400, error, res)
            } else if (typeof rows !== 'undefined' && rows.length > 0) {
                response.send(302, {message: `Пользователь с таким логином или номером телефона уже зарегистрирован`}, res)
            } else {
                const phone = req.body.phone
                const login = req.body.login
                const salt = bcrypt.genSaltSync(15)
                const password = bcrypt.hashSync(req.body.password, salt)
    
                const sql = "INSERT INTO `users` (`login`, `phone`, `password`) VALUES('" + login + "', '" + phone + "', '" + password + "')";
                db.query(sql, (error, results) => {
                    if(error) {
                        response.send(400, error, res)
                    } else {
                        response.send(200, {message: `Успешная регистрация`, results}, res)
                    }
                })
            }
        })
    } catch (e) {response.send(400, e.toString(), res)}
}

exports.SignIn = async (req, res) => {
    try {
        db.query("SELECT `id`, `login`, `password`, `phone` FROM `users` WHERE `phone` = '+" + req.body.phone.replace('+', '') + "'", (error, rows, fields) => {
            if(error) {
                response.send(400, error, res)
            } else if(rows.length <= 0) {
                response.send(401, {message: "Пользователя с таким номером телефона не существует"}, res)
            } else {
                const row = JSON.parse(JSON.stringify(rows))
                row.map(rw => {
                    const password = bcrypt.compareSync(req.body.password, rw.password)
                    if(password) {
                        const token = jwt.sign({
                            user_id: rw.id,
                            phone: rw.phone,
                            login: rw.login
                        }, config.JWTSECRET, { expiresIn: "14d" }) // 2 weeks
                        response.send(200, {token: `Bearer ${token}`}, res)
                    } else response.send(401, {message: "Неверный пароль"}, res)
                    return true;
                })
            }
        })
    } catch (e) {response.send(400, e.toString(), res)}
}

exports.updateProfilePicture = async (req, res) => {
    try {
        var tokenPayload = jwt.decode(req.headers.authorization.replace('Bearer ',''));
        let imageExtentions = ['.jpg', '.jpeg', '.png'];
        if (tokenPayload) {
            if (req.files) {
                if (Object.prototype.hasOwnProperty.call(req.files, 'image')) {
                    let imageName = req.files.image.name;
                    if (req.files.image.size <= config.UPLOAD_MAX_PICTURE_SIZE) {
                        if (isExt(req.files.image.name.toLowerCase(), imageExtentions)) {
                            req.files.image.mv(config.PROJECT_DIR + '/Uploads/ProfilePictures/' + tokenPayload.user_id + ".png") // imageName.substr(imageName.lastIndexOf('.'))
                                .then(() => {
                                    let filepath = '/Uploads/ProfilePictures/' + tokenPayload.user_id + ".png" // imageName.substr(imageName.lastIndexOf('.'))
                                    const sql = "UPDATE `users` SET `profile_picture` = '" + filepath + "' WHERE `users`.`id` = " + tokenPayload.user_id;
                                    db.query(sql, (error, results) => {
                                        if(error) response.send(400, error, res)
                                        else response.send(200, {message: `Фото профиля обновлено`, results}, res)
                                    })
                                }).catch(error => response.send(400, `Ошибка загрузки изображения [${error.message}]`, res))
                        } else response.send(400, "Формат изображения должно быть подходящим", res)
                    } else response.send(400, "Размер изображения должен быть менее 10 МБ", res)
                } else response.send(400, "Изображение должно быть загружено с атрибутом 'image'", res)
            } else response.send(400, "Вы должны загрузить изображение", res)
        } else response.send(400, "Требуется токен", res)
    } catch (e) {response.send(400, e.toString(), res)}
}

exports.updateData = async (req, res) => {
    try {
        var tokenPayload = jwt.decode(req.headers.authorization.replace('Bearer ',''));
        var queryArr = [];
        const login = req.body.login
        const phone = req.body.email

        if (login) queryArr.push("`login` = '" + login + "'");
        if (phone) queryArr.push("`phone` = '" + phone + "'");

        let finalQuery = queryArr.join(", ")

        if (tokenPayload) {
            db.query("UPDATE `users` SET" + finalQuery + "WHERE `users`.`id` = " + tokenPayload.user_id, (error, rows, fields) => {
                if(error) {
                    response.send(400, error, res)
                } else {
                    response.send(200, rows, res)
                }
            })
        } else response.send(400, "Требуется токен", res)
    } catch (e) {response.send(400, e.toString(), res) }
}