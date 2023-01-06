'use strict'

module.exports = (app) => {
    const UserController = require('./Controller/UserController')
    const ChatController = require('./Controller/ChatController')
    const MessageController = require('./Controller/MessageController')

    const passport = require('passport')

    //---------------------------------------UserRequests-------------------------------------------------------
    app.route('/api/users').get(passport.authenticate('jwt', {session: false}), UserController.getAllUsers)
    app.route('/api/user').get(passport.authenticate('jwt', {session: false}), UserController.getUserById)
    app.route('/api/me').get(passport.authenticate('jwt', {session: false}), UserController.getMyData)
    app.route('/api/user/search').get(passport.authenticate('jwt', {session: false}), UserController.searchUser)
    app.route('/api/auth/signup').post(UserController.SignUp)
    app.route('/api/auth/signin').post(UserController.SignIn)
    app.route('/api/profile/image').post(passport.authenticate('jwt', {session: false}), UserController.updateProfilePicture)
    app.route('/api/profile/data').post(passport.authenticate('jwt', {session: false}), UserController.updateData)

    //---------------------------------------ChatRequests-----------------------------------------------------
    app.route('/api/chat/create').post(passport.authenticate('jwt', {session: false}), ChatController.createChat)
    app.route('/api/chat/get').get(passport.authenticate('jwt', {session: false}), ChatController.getChats)

    //---------------------------------------MessageRequests-----------------------------------------------------
    app.route('/api/chat/messages').get(passport.authenticate('jwt', {session: false}), MessageController.getMessages)
    app.route('/api/chat/imageappend').post(passport.authenticate('jwt', {session: false}), MessageController.appendImage)
    app.route('/api/chat/send-message').post(MessageController.sendMessage)
    app.route('/test').get(MessageController.test)
}