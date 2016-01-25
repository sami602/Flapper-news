angular.module('flapperNews')

    .factory('posts', ['$http', function($http) {
        var o = {
            posts: []
        };
        o.getAll = function() {
            return $http.get('/api/posts.json').success(function(data){
                angular.copy(data, o.posts);
            });
        };

        o.get = function(id) {
            return $http.get('/api/posts/' + id + '.json').then(function(res){
                return res.data;
            });
        };

        o.create = function(post) {
            return $http.post('/api/posts.json', post).success(function(data){
                o.posts.push(data);
            });
        };
        o.destroy = function(post){
            $http.delete('/api/posts/' + post.id)
                .success(function(data){
                    o.posts.splice(post.id,1);
                });

        };

        o.upvote = function(post) {
            return $http.put('/api/posts/' + post.id + '/upvote.json')
                .success(function(data){
                    post.upvotes += 1;
                });
        };

        o.addComment = function(id, comment) {
            return $http.post('/api/posts/' + id + '/comments.json', comment);
        };

        o.upvoteComment = function(post, comment) {
            return $http.put('/api/posts/' + post.id + '/comments/'+ comment.id + '/upvote.json')
                .success(function(data){
                    comment.upvotes += 1;
                });
        };

        return o;
    }]);
