@newEpicTube.controller 'videos_show', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $scope.video
  $http.get("/api/videos/#{$routeParams.id}").success((data) ->
    $scope.video = data
  )
]