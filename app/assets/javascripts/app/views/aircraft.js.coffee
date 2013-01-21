#= require app/views/viewbase

class App.Views.Aircraft extends App.Views.ViewBase
  initialize: (options) ->
    options.template = $('#aircraft_template').html()
    super

  events: ->
    _.extend super,
      'click .make a' : 'showAircraft'

  showAircraft: (event) ->
    event.preventDefault()
    App.router.navigate(@model.url(), trigger: true)