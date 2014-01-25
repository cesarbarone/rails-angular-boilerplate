'use strict'

angular.module('appApp')
  .service 'Session', () ->
    session =
      setUser: (@user)->
      setToken: (@user)->

      getToken: ()->
        @token

      getUser: ()->
        @user

      clear: ()->
        @token = '' and @user = {}
