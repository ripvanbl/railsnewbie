#= require app/models/aircraft

class App.Collections.Aircraft extends Backbone.Collection
  model: App.Models.Aircraft
  url: '/aircraft'

  comparator: (model) ->
    -model.get('make')