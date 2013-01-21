#= require app/views/viewbase_collection

class App.Views.Aircraft.List extends App.Views.CollectionViewBase
  initialize: (options) ->
    options.template = $('#aircraft_list_template').html()
    super
    @collection.on('add', @highlightNewView, @)
    @selectionModel.on('select:none', @show, @)
    @selectionModel.on('select', @hide, @)

  highlightNewView: (model, collection, options) ->
    @getView(model).$el.effect('highlight', 'slow')

  render: ->
    super