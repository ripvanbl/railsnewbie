window.App = {
  Collections: {}
  Controllers: {}
  Models: {}
  Presenters: {}
  Views: {}
}

$(->
  return unless App.init

  App.router = new App.Router
  new App.Controllers.Aircraft(App.init, App.router)

  Backbone.history.start pushState: true
)