MainView = require('views/main_view')
module.exports = class Application
  initialize: (cb) =>
    @main_view = new MainView()
    cb
  render: ->
