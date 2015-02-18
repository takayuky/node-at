moment = require 'moment'

module.exports =
  schedule: (date_str, callback) ->
    setTimeout callback, this._getTimeDiff(date_str)

  _getTimeDiff: (date_str) ->
    this._parseStrToMoment(date_str).valueOf() - moment().valueOf()

  _parseStrToMoment: (date_str) ->
    date_arr = /([0-9]+):([0-9]+)/.exec(date_str)
    if date_arr != null
      hour = parseInt(date_arr[1], 10)
      minute = parseInt(date_arr[2], 10)
      if not (0 <= hour <= 23 && 0 <= minute <= 59)
        throw new Error("invalid date")
      date = moment().hours(hour).minutes(minute).seconds(0).milliseconds(0)
      #既にその時刻を過ぎていた場合は、1日足す
      date.add(1, 'day') if date < moment()
      return date
    else
      return null
