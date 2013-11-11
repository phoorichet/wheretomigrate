mhControllers = angular.module('mhControllers', [])

mhControllers.controller('CitySearchCtrl', ['$scope', 'City', ($scope, City)->
  $scope.city = City.query()
])
