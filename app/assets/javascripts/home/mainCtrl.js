angular.module('flapperNews')
    .controller('MainCtrl', [
        '$scope','posts',
        function($scope, posts){
            console.log('MainCtrl');
            $scope.posts = posts.posts;
            $scope.incrementUpvotes = function(post) {
                posts.upvote(post);
            };
            $scope.destroy = function(post) {
                posts.destroy(post);

            };
            $scope.update = function(post){
                posts.update(post)
            }

            $scope.addPost = function(){
                if(!$scope.title || $scope.title === '') {return;}

                posts.create({
                    title: $scope.title,
                    link: $scope.link
                });
                $scope.title = '';
                $scope.link = '';

            };


        }]);

/**
 * Created by sami on 21/01/16.
 */
