'use strict'

angular.module('appApp')
  .constant 'callAction', (condition, callbackWhenTrue, callbackWhenFalse) ->
    returning = null
    returning = callbackWhenTrue() if callbackWhenTrue? and condition
    returning = callbackWhenFalse() if callbackWhenFalse? and not condition
    returning
