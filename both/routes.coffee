Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: ->
    Meteor.subscribe 'activities',
      time:
        $gt: (new Date()).setMonth((new Date()).getMonth() - 1)

Router.map ->
  @route 'activities', { path: '/' }

Router.onBeforeAction 'loading'