'use strict'

angular.module('appApp')
  .controller 'UserCtrl', ($scope, Restangular) ->
    $scope.teste = '2'
    $scope.allUsers = null
    
    Restangular.setBaseUrl('http://localhost:3000/api')
    $scope.searchUsers = ->
      users = Restangular.all('users')
      console.log 'teste'
      users.getList().then (users) ->
        console.log 'teste2'
        $scope.allUsers = users
      console.log 'teste3'

    $scope.alerta = ->
      alert('viva')

