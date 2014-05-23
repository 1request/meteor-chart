@DailyResults = new Meteor.Collection 'dailyResults'

  # activities = Activities.find(options, sort: {time: 1}).fetch()
  # initial = moment(_.first(activities).time).startOf('day')
  # next = moment(initial).add('days', 1)
  # last = moment(_.last(activities).time).startOf('day').add('days', 1)
  # console.log 'last', last.format()
  # data = []
  # while last.diff(next) >= 0
  #   count = Activities.find(time: {$lt: next.valueOf(), $gt: initial.valueOf()}).count()
  #   data.push {date: initial.valueOf(), count: count}
  #   initial = moment next
  #   next = moment(initial).add('days', 1)
  # console.log 'data', data