users = [
  'harry'
  'anil'
  'charles'
  'leo'
  'mark'
  'nigel'
  'alex'
  'simon'
  'mu wah'
  'christian'
  'charlie'
  'marco'
  'joseph'
  'annie'
  'victor'
  'leo'
  'julie'
]

if Members.find().count() is 0
  for user in users
    Members.insert
      name: user

if Activities.find().count() is 0

  randomTimestamp = (momentObj, times) ->
    nextDay = moment(momentObj).endOf('day')
    momentObj.add 'milliseconds', Math.random() * Math.min(36000000 / times, nextDay.diff(momentObj))

  base =
    "__v": 0
    time: null
    "beaconId": "312"
    "strength": "0.5"

  for user in Members.find().fetch()
    for i in [30..1]
      timestamp = moment().subtract('days', i).hours(9)
      randomTimes = _.sample [0, 1, 3, 5, 7, 9]
      if randomTimes isnt 0
        for j in [0..randomTimes]
          date = randomTimestamp(timestamp, randomTimes).valueOf()
          base.time = date
          base.memberId = user._id
          base.status = if j % 2 == 0 then "entry" else "exit"
          Activities.insert base