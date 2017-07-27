express = require 'express'
app = express.Router()

# add the api end points
app.use '/', require './api'

app.route('/test')
.get (req, res, next) ->
    return res.json "test"

module.exports = app