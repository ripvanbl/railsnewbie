define(['underscore', 'backbone'], function(_, Backbone) {
    var AircraftModel = Backbone.Model.extend({
        defaults: {
            title: 'donno',
            grounded: false
        }
    });

    return AircraftModel;
});