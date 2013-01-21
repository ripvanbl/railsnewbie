#= require app/views/aircraft
#= require app/views/aircraft_list

class App.Controllers.Aircraft
  constructor: (data, router) ->
    aircraft = new App.Collections.Aircraft(data)
    selectionModel = new App.SelectionModel(aircraft)
    aircraftPresenter = (model) -> new App.Presenters.Aircraft(model)

    new App.Views.Aircraft.List
      collection: aircraft
      el: $('#list')
      selectionModel: selectionModel
      selector: '#aircraft_list'
      view: (model) ->
        new App.Views.Aircraft
          model: model
          presenter: aircraftPresenter


    router.on 'route:listAircraft', () ->
      selectionModel.select()

    router.on 'route:showAircraft', (aircraftId) ->
      selectionModel.select(aircraftId)