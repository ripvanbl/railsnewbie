define(['jquery', 'backbone', 'collections/aircraft'], function($, Backbone, Aircraft) {
    var Workspace = Backbone.Router.extend({
        routes: {
            'aircraft/:id': 'viewAircraft'
        },
        viewAircraft: function(param) {
            
        }
    });

    return Workspace;
});