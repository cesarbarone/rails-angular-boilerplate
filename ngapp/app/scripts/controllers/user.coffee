'use strict'

angular.module('appApp')
  .controller 'UserCtrl', ["$scope", "empty", "Models", ($scope, empty, Models) ->
    
    $scope.user =
      email: empty
      password: empty
      password_confirmation: empty

    $scope.create = ()->
      Models.users.post(user: $scope.user).then(alertSuccess, alertError)

    alertSuccess = ->
      alert("User created")
    
    alertError = ->
      alert("User not created")

  ]
