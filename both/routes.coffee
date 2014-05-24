Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: ->
    Meteor.subscribe 'dailyResults',
      time:
        $gt: moment().startOf('month').valueOf()

Router.map ->
  @route 'activities', { path: '/' }

Router.onBeforeAction 'loading'