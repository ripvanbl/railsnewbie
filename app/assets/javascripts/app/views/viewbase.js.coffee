class App.Views.ViewBase extends Backbone.View
  initialize: (options) ->
    @template ||= options.template
    @presenter ||= options.presenter
    @selectionModel = options.selectionModel
    @

  destroy: ->
    @hide()
    @unbind()
    @remove
    @

  events: ->
    {}

  hide: ->
    @$el.hide()
    @

  html: (html) ->
    @$el.html(html)
    @

  render: ->
    @_rendered = true
    if @template?
      @html(@renderTemplate(@template, @renderContext()))
    @

  renderContext: ->
    if @presenter?
      @presenter.apply(@, [@model])
    else if @model?
      @model.toJSON()
    else
      {}

  renderTemplate: (template, context) ->
    _.template(template, context)

  show: ->
    @render() unless @_rendered?
    @$el.show()
    @

  unbind: ->
    @undelegateEvents()
    @model.off(null, null, null) if @model
    @collection.off(null, null, null) if @collection
    null