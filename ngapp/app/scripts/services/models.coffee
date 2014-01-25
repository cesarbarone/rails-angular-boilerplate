'use strict'

angular.module('appApp')
  .service 'Models', ["Restangular", "Session", (Restangular, Session) ->
    bondRestangular = Restangular.withConfig (restangularConfigurer)->
      restangularConfigurer.setDefaultHeaders({'Authorization': 'Token token='.concat Session.getToken()})

    models =
      sessions: bondRestangular.all 'sessions'
  ]
