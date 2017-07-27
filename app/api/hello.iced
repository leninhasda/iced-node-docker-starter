express = require 'express'
api = express.Router()

api.route('/hello')
.get (req, res, next) ->
    # return res.json {message: "hello"}
    return res.json ["hello"]

module.exports = api