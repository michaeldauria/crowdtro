app = angular.module('crowdtro', ['ngResource'])

app.controller 'HeaderCtrl', ($scope, Me) ->
  $scope.me = Me.get()

app.controller 'CrowdtroCtrl', ($scope, Concern) ->
  $scope.newConcern = { content: 'what' }

  $scope.concerns = Concern.query()

  $scope.addConcern = (concern) ->
    concern = new Concern(concern)
    concern.$save()
    $scope.concerns.push concern

  $scope.updateConcern = (index) ->
    $scope.concerns[index].$update()

  $scope.completeConcern = (concern) ->
    concern.complete = "true"
    concern.$update()

  $scope.resurrectConcern = (concern) ->
    concern.complete = "false"
    concern.$update()

  $scope.checkSubmit = (event, concern, current)->
    if event.keyCode == 13
      event.preventDefault()
      if current
        concern.$update()
        current.editing = false
      else
        $scope.addConcern(concern)
        concern.content = ""

  $scope.trashConcern = (index) ->
    concern = $scope.concerns.splice(index, 1)
    concern[0].$remove()

  $scope.upVote = (concern) ->
    concern.score++
    concern.$update()

  $scope.downVote = (concern) ->
    if concern.score > 0
      concern.score--
      concern.$update()

app.factory 'Concern', ( $resource ) ->
  $resource '/concerns/:id', { id: '@id' }, update: { method: 'PUT' }

app.factory 'Me', ( $resource ) ->
  $resource '/me'
