#= require app/views/viewbase

class App.Views.Aircraft.New extends App.Views.ViewBase
  initialize: (options) ->
    options.template = $('#aircraft_new_template').html()
    super