if Activities.find().count() is 0
  lastMonth = new Date()
  lastMonth.setDate(lastMonth.getDate() - 7)
  randomDate = (start, end) ->
    new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()))

  basic =
    "__v": 0
    time: null
    "beaconId": "312"
    "strength": "0.5"
    "username": "harryng"

  for i in [1..300]
    date = randomDate(lastMonth, new Date((new Date()).setHours(0,0,0,0)))
    basic.time = date.getTime()
    Activities.insert basic