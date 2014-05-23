Meteor.publish 'activities', (options) ->
  console.log 'options', options
  Activities.find options