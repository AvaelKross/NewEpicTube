@newEpicTube.controller 'videos_index', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.videos = []
  $http.get('/api/videos/').success((data) ->
    $scope.videos = data
  )

  $scope.showVideo = (id) ->
    $location.url "/videos/#{id}"
]