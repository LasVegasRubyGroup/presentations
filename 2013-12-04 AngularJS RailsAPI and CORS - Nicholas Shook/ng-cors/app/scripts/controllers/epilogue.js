angular.module('ngCorsApp')
.controller('EpilogueCtrl', function ($scope) {
  $scope.books = [
{title: 'AngularJS Docs',link: 'http://docs.angularjs.org/api/'},
{title: 'AngularJS in Action', link: 'http://www.manning.com/bford/'},
{title: 'AngularJS Directives', link: 'https://play.google.com/store/books/details?id=Pfxbc8xY7f4C&source=productsearch&utm_source=HA_Desktop_US&utm_medium=SEM&utm_campaign=PLA&pcampaignid=MKTAD0930BO1'},
{title: 'Egghead.io', link: 'http://egghead.io/'},
{title: 'Recipes with AngularJS', link: 'https://leanpub.com/recipes-with-angular-js'}
]
});
