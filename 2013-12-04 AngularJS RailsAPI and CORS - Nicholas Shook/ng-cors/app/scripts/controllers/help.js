'use strict';

angular.module('ngCorsApp')
    .controller('HelpCtrl', ['$scope','$modal','$log', function ($scope, $modal, $log) {
        $scope.items = [        // 
            {
                title: 'This is a demo',
                content: 'The purpose of this website is to get validation on our idea at <b>Startup Weekend Las Vegas</b>. We have not built a back-end server implementation aside from our <b>Contact Form</b>.'
            },
            {
                title: 'Creating a Dispute',
                content: 'To create a dispute:<br>1. <b>Sign Up</b><br>2.  Click "Create a Dispute"<br>3.  Accept the Terms of Service<br>4.  Choose your Parameters (i.e. Term of Voting, Character Limit)<br>5.  Write your Side of the Story<br>6.  Submit and Wait for Other Side'
            },
            {
                title: 'Voting on a Dispute',
                content: 'To vote on a dispute:<br>1.  <b>Sign Up</b> and <b>Sign In</b><br>2.  Click your personalized tab in the top corner <br>3.  Scroll to "Open Disputes"<br>4.  Click on any Dispute<br>5.  Vote!'
            },
            {
                title: 'Sign Up for BothSides',
                content: 'To Sign Up to Vote or Create a Dispute:<br>1.  Go to the <b>Sign Up</b> Page<br>2.  Enter your Sign Up Information<br>3.  Hit Enter and VOTE!'
            }];

        $scope.open = function () {

            var modalInstance = $modal.open({
                templateUrl: 'views/help.html',
                controller: ['$scope', '$modalInstance','items', function ($scope, $modalInstance, items) {
                    $scope.items = items;
                    $scope.selected = {
                        item: $scope.items[0]
                    };
                    $scope.ok = function () {
                        $modalInstance.close();
                    };
                }],
                resolve: {
                    items: function () {
                        return $scope.items;
                    }
                }
            });

        };
    }]);
