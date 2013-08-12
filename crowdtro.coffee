app = angular.module 'crowdtro', ['ngResource']

app.controller 'CrowdtroCtrl', ($scope, Concern) ->
  $scope.concerns = []

  $scope.addConcern = (concern) ->
    concern = angular.copy concern
    c = new Concern(concern)
    c.$save (d) ->
      console.log d
      console.log c

  $scope.newConcern = { content: 'what', score: 0, complete: false }

app.factory 'Concern', ( $resource ) ->
  $resource '/concerns'
