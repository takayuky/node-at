chai = require 'chai'
expect = chai.expect
chai.should()

moment = require 'moment'

at = require("../src/at")

describe 'at',->

  now = null

  before ->
    now = moment()

  it 'future time "HH:mm" format', ->
    future = new Date
    future.setHours(23, 59, 0, 0)
    at._getTimeDiff('23:59', now).should.equal future.getTime() - now.valueOf()

  it 'past time "HH:mm" format', ->
    past = new Date
    past.setHours(0, 0, 0, 0)
    past.setTime(past.getTime() + 24 * 60 * 60 * 1000)
    at._getTimeDiff('00:00', now).should.equal past.getTime() - now.valueOf()

  it 'invalid date error for "HH:mm" format', ->
    expect(at._getTimeDiff.bind(at, '25:00', now)).to.throw('invalid date')


  it 'moment format syntax test', ->
    moment("2045-02-28 00:45", "YYYY-MM-DD HH:mm").valueOf().should.equal moment("2045.02.28 00:45", "YYYY-MM-DD HH:mm").valueOf()
    moment("2045-02-28 00:45", "YYYY-MM-DD HH:mm").valueOf().should.equal moment("2045/02/28 00:45", "YYYY-MM-DD HH:mm").valueOf()

  it '"YYYY-MM-DD HH:mm" format', ->
    at._getTimeDiff('2045-02-28 15:13', now).should.equal (new Date(2045,2 - 1 ,28,15,13)).getTime() - now.valueOf()

  it '"YYYY.MM.DD HH:mm" format', ->
    at._getTimeDiff('2045.02.28 15:13', now).should.equal (new Date(2045,2 - 1 ,28,15,13)).getTime() - now.valueOf()

  it '"YYYY/MM/DD HH:mm" format', ->
    at._getTimeDiff('2045/02/28 15:13', now).should.equal (new Date(2045,2 - 1 ,28,15,13)).getTime() - now.valueOf()

  it 'invalid date error for "YY-MM-DD HH:mm" format', ->
    expect(at._getTimeDiff.bind(at, '2045/02/29 10:00', now)).to.throw('invalid date')

  it 'past date error for "YY-MM-DD HH:mm" format', ->
    expect(at._getTimeDiff.bind(at, '1999/01/01 10:00', now)).to.throw('specified date has past already')

  it 'random string', ->
    expect(at._getTimeDiff.bind(at, 'abdlalf al:fadf', now)).to.throw('invalid date')

