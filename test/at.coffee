chai = require 'chai'
expect = chai.expect
chai.should()

at = require("../src/at")

describe 'at',->

  it 'future time HH:mm syntax', ->
    future = new Date
    future.setHours(23, 59, 0, 0)
    at._getTimeDiff('23:59').should.equal future.getTime() - (new Date).getTime()

  it 'past time HH:mm syntax', ->
    past = new Date
    past.setHours(0, 0, 0, 0)
    past.setTime(past.getTime() + 24 * 60 * 60 * 1000)
    at._getTimeDiff('00:00').should.equal past.getTime() - (new Date).getTime()
