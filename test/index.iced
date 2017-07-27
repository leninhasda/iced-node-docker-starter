# demo test
chai = require 'chai'
chaiHttp = require 'chai-http'
should = chai.should()
assert = chai.assert
expect = chai.expect

chai.use chaiHttp
config = require '../utils/config'
server = require '../index'
request = require 'request'
express = require 'express'
app = express()

describe 'api', ->
    url = '/api'
    describe 'hello', ->
        url +='/hello'

        it 'should return status 200', (done) ->
            await chai.request(server).get(url).end defer err, resp
            if err?
                return done err

            # should way
            resp.statusCode.should.be.equal(200)
            # expect way
            expect(resp.statusCode).to.equal(200)
            # assert way
            assert.equal(resp.statusCode, 200)
            done()

        it 'should be a string', (done) ->
            await chai.request(server).get(url).end defer err, resp
            if err?
                return done err

            result = resp.body.pop()

            # should way
            result.should.be.a('string')
            result.should.equal('hello')

            # expect way
            expect(result).to.be.a('string')
            expect(result).to.equal('hello')
            # assert way
            assert.typeOf(result, 'string')
            assert.equal(result, 'hello')

            done()