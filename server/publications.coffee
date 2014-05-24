Meteor.publish 'activities', (options) ->
  Activities.find options

Meteor.publish 'dailyResults', (options) ->
  DailyResults.find options