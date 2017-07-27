express = require 'express'
bodyParser = require 'body-parser'

config = require './utils/config'
logger = require './utils/logger'

app = express()
app.set 'views', __dirname+'/views'
app.set 'view engine', 'pug'
app.disable 'x-powered-by'
app.enable 'trust proxy'
app.use bodyParser.json()
app.use express.static __dirname+'/public'

app.use '/', require './app'

app.use (err, req, res, next)->
    if err instanceof SyntaxError and err.status is 400 and 'body' of err
        return res.sendStatus 400

    if err?
        logger.error err.toString()
        return res.sendStatus 500

app.use (req, res, next)->
    return res.status(404).send('Not found')

server = app.listen config.PORT, ->
    logger.info "Listening on #{config.PORT}"

process.on 'SIGINT', ->
    process.exit()

process.on 'exit', ->
    logger.info 'Exiting...'

module.exports = app
# module.exports = server