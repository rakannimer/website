module.exports = Backbone.View.extend
  el: $("#main")
  template: require './templates/main'
  initialize: ->
    @render()
  render: ->
    @$el.html @template()
