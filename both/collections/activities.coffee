@Activities = new Meteor.Collection 'activities'

if Meteor.isServer
  Meteor.startup ->
    activitiesAPI = new CollectionAPI

    activitiesAPI.addCollection Activities, 'activities'

    activitiesAPI.start()