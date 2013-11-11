# define migrant haven services
mhServices = angular.module('mhServices', ['ngResource'])

mhServices.factory('City', ['$resource', ($resource) ->
  $resource('cities/:cityName.json', {}, {
    query: {method:'GET', params:{phoneId:'phones'}, isArray:true}
  })
])
