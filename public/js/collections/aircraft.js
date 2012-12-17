define(['underscore', 'backbone', 'lib/backbone/localstorage', 'models/aircraft'], function(_, Backbone, Store, Aircraft) {
    var AircraftCollection = Backbone.Collection.extend({
        model: Aircraft,
        localStorage: new Store('va-aircraft')
    });

    return new AircraftCollection();
});