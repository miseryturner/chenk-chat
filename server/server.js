const express =     require('express')
const cors =        require('cors')
const app =         express()
const WebSocket =   require('ws')
const port =        process.env.APP_PORT || 3500
const bodyParser =  require('body-parser')
const routes =      require('./routes')
const passport =    require('passport')
const fileUpload =  require('express-fileupload')
const config =      require('./configuration')
const db =          require('./Database/database')
const path =        require('path')
const fs =          require('fs')

app.use(cors({ origin: '*', credentials: true, optionSuccessStatus: 200 }));
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(passport.initialize())
app.use(fileUpload({}));

require('./Middleware/passport')(passport)

routes(app)

// ---------------------------------------------------------------------------------------
app.use('/uploads/', express.static(config.PROJECT_DIR + '/Uploads/ProfilePictures/'));
app.use('/uploads/', express.static(config.PROJECT_DIR + '/Uploads/ChatImages/'));
// ---------------------------------------------------------------------------------------

app.listen(port, () => {
    console.clear();
    var now = new Date();
    var startedTime = (now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds());
    console.log(`[APP] App listen on port ${port} | Started at: ${startedTime}`);
})

const indexPath = path.join('../client/index.html');

app.get('/', (req, res) => {
    res.redirect("http://chenk-chat.na4u.ru/")
})
