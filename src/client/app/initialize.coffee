vent = _.extend({}, Backbone.Events)

$ ->
  Application = require 'application'
  app = new Application()
  app.initialize ->
    #----------------------------------#
    # Create the router and its routes
    #----------------------------------#
    Router = require('router')
    app_router = new Router
    app_router.on "route:home", ->
      app.render()

    Backbone.history.start()
