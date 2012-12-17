define(['jquery', 'underscore', 'backbone', 'text!templates/aircraft.html', ], function($, _, Backbone, aircraftTemplate) {
    var AircraftView = Backbone.View.extend({
        tagName: 'li',
        template: _.template(aircraftTemplate),
        events: {
            'click .destroy': 'clear'
        },
        initialize: function() {
            this.model.on('change', this.render, this);
            this.model.on('destroy', this.remove, this);
        },
        render: function() {
            this.$el.html(this.template(this.model.toJSON()));
            return this;
        },
        clear: function() {
            this.model.destroy();
        }
    });

    return AircraftView;
});