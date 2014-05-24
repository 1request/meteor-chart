@Activities = new Meteor.Collection 'activities'

if Meteor.isServer
  Meteor.startup ->
    activitiesAPI = new CollectionAPI
    activitiesAPI.addCollection Activities, 'activities'
    activitiesAPI.start()

incrementEntryExit = (collection, id, activity) ->
  if activity.status is 'entry'
    collection.update id, { $inc: {entryCount: 1} }
  else
    collection.update id, { $inc: {exitCount: 1} }

createDailyOrHourlyResult = (collection, activity, type) ->
  obj =
    time: moment(activity.time).startOf(type).valueOf()
    status: activity.status
  if activity.status is 'entry'
    obj.entryCount = 1
    obj.exitCount = 0
  else
    obj.entryCount = 0
    obj.exitCount = 1
  obj

updateResult = (collection, activity) ->
  type = if collection is DailyResults then 'day' else 'hour'
  result = collection.findOne { time: moment(activity.time).startOf(type).valueOf() }
  if result
    incrementEntryExit(collection, result._id, activity)
  else
    collection.insert createDailyOrHourlyResult(collection, activity, type)

Activities.after.insert (userId, doc) ->
  updateResult(DailyResults, doc)
  updateResult(HourlyResults, doc)