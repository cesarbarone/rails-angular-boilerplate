'use strict'

angular.module('appApp')
  .service 'Redirects', ['$state', ($state) ->
    redirects =
      goPageDashboard: () ->
         $state.transitionTo 'home'
  ]
