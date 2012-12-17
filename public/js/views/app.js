define(['jquery', 'underscore', 'backbone', 'collections/aircraft', 'views/aircraft'], function($, _, Backbone, Aircraft, AircraftView) {
    var AppView = Backbone.View.extend({
        el: '#vaapp',
        events: {
            'click #new-aircraft-button': 'createAircraft'
        },
        initialize: function() {
            Aircraft.on('add', this.addOne, this);
            Aircraft.on('all', this.render, this);
            Aircraft.fetch();
        },
        render: function() {
            this.$('#aircraft-list').html('');
            Aircraft.each(this.addOne, this);
        },
        addOne: function(aircraft) {
            var view = new AircraftView({ model: aircraft });
            $('#aircraft-list').append(view.render().el);
        },
        createAircraft: function() {
            Aircraft.create({
                title: this.$('#new-aircraft').val().trim(),
                grounded: false
            });

            this.$('#new-aircraft').val('');
        }
    });

    return AppView;
});