'use strict'

angular.module('appApp', [
  'ngResource',
  'ui.router',
  'restangular'
])
  .config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise '/users'

    $stateProvider
      .state 'default',
        abstract: true
        views:
          "":
            templateUrl: 'index.html'
            controller: 'ApplicationCtrl'
      .state 'users',
        parent: 'default'
        url: '/users'
        views:
          "":
            templateUrl: '/views/users.html'
            controller: 'UserCtrl'
  ]
