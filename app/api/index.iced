express = require 'express'

api = express.Router()

api.use '/api', require './hello'


module.exports = api