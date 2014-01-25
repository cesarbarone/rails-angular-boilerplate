angular.module('appApp').config ["RestangularProvider", (RestangularProvider) ->
  RestangularProvider.setBaseUrl 'http://localhost:3000/api'
]
