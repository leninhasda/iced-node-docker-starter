# basically a .env parser
# all of our configuration will be in .env file
#
fs = require 'fs'

config = {}

# try to load the .env file
try
    env = fs.readFileSync '.env', 'utf8'
catch error
    throw new Error("No env file")

for pair in env.split /\s*\n/
    if pair isnt '' and (index = pair.indexOf('=')) isnt -1
        key = pair.substr(0, index)
        value = pair.substr(index + 1)
        if key.trim()
            config[key] = value

# try to load .env.local if any
# this is just for test purpose
# there will be no such files in production
try
    localEnv = fs.readFileSync '.env.local', 'utf8'

    for pair in localEnv.split /\s*\n/
        if pair isnt '' and (index = pair.indexOf('=')) isnt -1
            key = pair.substr(0, index)
            value = pair.substr(index + 1)
            if key.trim()
                config[key] = value
catch e
    # console.log "no local env"

module.exports = config
