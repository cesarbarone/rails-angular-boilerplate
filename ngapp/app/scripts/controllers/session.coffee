'use strict'

angular.module('appApp')
  .controller 'SessionCtrl', ["Models", "Session", "Redirects", "$scope", "callAction", "empty", (Models, Session, Redirects, $scope, callAction, empty)->
    $scope.authentication =
      email: empty
      password: empty

    $scope.messages =
      error: empty

    $scope.signIn = ()->
      setMessageError(empty)
      callAction($scope.formLogin.$valid, actionWhenValidDataAuth, loginOnError)

    loginOnSuccessRequest = (session) ->
      Session.setUser(session.user)
      Session.setToken(session.token)
      Redirects.goPageDashboard()

    loginOnError = ()->
      setMessageError("Invalid Authentication")

    setMessageError = (message) ->
      $scope.messages.error = message

    actionWhenValidDataAuth = ()->
      Models.sessions.post($scope.authentication).then(loginOnSuccessRequest, loginOnError)
  ]
