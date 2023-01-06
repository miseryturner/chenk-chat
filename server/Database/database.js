const mysql = require('mysql')
const config = require('../configuration')

const connection = mysql.createPool({
    host: config.HOST,
    socketPath: "/var/run/mysqld/mysqld.sock",
    port: config.PORT,
    user: config.DBUSER,
    password: config.DBPASSWORD,
    database: config.DBNAME
})

// connection.connect((error) => {
//     if(error) {
//         return console.log('[DB] Database connection error');
//     } else {
//         return console.log('[DB] Connection successfully');
//     }
// })

module.exports = connection

// const connection = mysql.createPool({
//     host: DBHOST,
//     socketPath: config.SOCKET,
//     port: APP_PORT,
//     user: DBUSER,
//     password: DBPASS,
//     database: DBNAME
// })