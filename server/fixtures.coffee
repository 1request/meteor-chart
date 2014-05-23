if Activities.find().count() is 0
  lastWeek = new Date()
  lastWeek.setDate(lastWeek.getDate() - 7)
  randomDate = (start, end) ->
    new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()))

  basic =
    "__v": 0
    time: null
    "beaconId": "312"
    "strength": "0.5"
    "username": "harryng"

  for i in [1..500]
    date = randomDate lastWeek, new Date()
    basic.time = date.getTime()
    Activities.insert basic