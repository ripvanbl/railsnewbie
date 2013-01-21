#= require app/views/viewbase

class App.Views.CollectionViewBase extends App.Views.ViewBase

  initialize: (options) ->
    super

    @selector ||= options.selector
    @view ||= options.view

    @collection.on('add', @add, @)
    @collection.on('destroy', @modelDestroyed, @)
    @collection.on('reset', @reset, @)

  add: (model, collection, options) ->
    newView = @getView(model).show()
    if options.index == 0
      @container().prepend(newView.$el)
    else
      existingModel = @collection.at(options.index - 1)
      existingView = @getView(existingModel)
      existingView.$el.after(newView.$el)

  container: ->
    @_container ||= @_ensureContainer()

  getView: (model) ->
    @view.apply(@, [model])

  modelDestroyed: (model, collection, options) ->
    view = @getView(model)
    view.destroy()


  render: ->
    super
    @reset()
    @

  renderContext: ->
    { collection: @collection }

  reset: (collection, options) ->
    @container().html('')
    @collection.each (model) =>
      @container().append(@getView(model).show().$el)

  _ensureContainer: ->
    if @selector?
      @$(@selector)
    else
      @$el