# define migrant haven services
mhServices = angular.module('mhServices', ['ngResource'])

mhServices.factory('City', ['$resource', ($resource) ->
  $resource('cities/search', {}, {
    query: {method:'GET', params:{city:'city'}, isArray:false}
  })
])
