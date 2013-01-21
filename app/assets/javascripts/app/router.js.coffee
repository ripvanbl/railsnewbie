class App.Router extends Backbone.Router
  routes:
    '' : 'listAircraft',
    'aircraft/:id' : 'showAircraft'