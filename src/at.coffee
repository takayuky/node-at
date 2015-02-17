
module.exports =
  schedule: (date_str, callback) ->
    setTimeout callback, this._parseDate(date_str).getTime() - (new Date).getTime()
    # this._parseDate(date_str).getTime() - (new Date).getTime()

  _parseDate: (date_str) ->
    date_arr = /([0-9]+):([0-9]+)/.exec(date_str)
    if date_arr != null
      hour = parseInt(date_arr[1], 10)
      minute = parseInt(date_arr[2], 10)
      if not (0 <= hour <= 23 && 0 <= minute <= 59)
        throw new Error("invalid date")
      date = new Date
      date.setHours(hour, minute, 0, 0)
      #既にその時刻を過ぎていた場合は、1日足す
      date.setTime(date.getTime() + 24 * 60 * 60 * 1000) if date < new Date
      return date
    else
      return null
