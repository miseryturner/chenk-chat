'use strict'

exports.send = (status, values, res) => {
    const data = { "status": status, "values": values }
    res.status(data.status)
    res.json(data)
    res.end()
}