require.config({
    shim: {
        'underscore': {
            exports: '_'
        },
        'backbone': {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        }
    },
    paths: {
        jquery: 'lib/jquery/jquery.min',
        underscore: 'lib/backbone/underscore',
        backbone: 'lib/backbone/backbone',
        text: 'lib/require/text'
    }
});

require([
    'views/app',
    'routers/router'], function(AppView, Workspace) {
        new Workspace();
        Backbone.history.start();
        new AppView();
    });