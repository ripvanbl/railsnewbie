#= require app/views/viewbase

class App.Views.DetailViewBase extends App.Views.ViewBase
  initialize: (options) ->
    super
    @view = options.view

    @collection.on 'destroy', @modelDestroyed, @
    @selectionModel.on 'select:none', @hideDetail, @
    @selectionModel.on 'select', @showDetail, @

  hideDetail: ->
    @currentView?.hide()

  modelDestroyed: (model, collection, options) ->
    view.destroy()

  showDetail: (model) ->
    @currentView?.hide()
    view = @view.apply(@, [model])
    @$el.append(view.render().$el)
    @currentView = view
    @currentView.show()