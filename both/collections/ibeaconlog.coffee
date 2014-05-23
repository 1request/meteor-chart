@Activities = new Meteor.Collection 'activities'

if Meteor.isServer
  Meteor.startup ->
    activitiesAPI = new CollectionAPI
    activitiesAPI.addCollection Activities, 'activities'
    activitiesAPI.start()

    Activities.after.insert (userId, doc) ->
      dailyResult = DailyResults.findOne { time: moment(doc.time).startOf('day').format('YYYY-MM-DD') }
      if dailyResult
        DailyResults.update dailyResult._id, {$inc: {count: 1}}
      else
        DailyResults.insert
          time: moment(doc.time).startOf('day').format('YYYY-MM-DD')
          count: 1