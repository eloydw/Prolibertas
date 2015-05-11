(function(){
  var app = angular.module('prolibertas-family', ['ui.router']);

  // Controllers
  app.controller('FamilyController', ['$http','$timeout','$rootScope', '$state', function($http, $timeout, $rootScope, $state){
     var scope = this;
     scope.families = [];
     scope.familyForm = {};
     scope.errors = {};

     scope.alertaCreado = $state.params.alertaCreado;

     // La alerta se oculta después de 5 segundos
     $timeout(function(){scope.alertaCreado = false;}, 5000);

     scope.alertaBorrado = $state.params.alertaBorrado;
     // La alerta se oculta después de 5 segundos
     $timeout(function(){scope.alertaBorrado = false;}, 5000);
     $rootScope.prolibertas = "Lista de Familias";

    $http.get('/families.json')
      .success(function(data){
        scope.families = data.families;
      });
    scope.change = function(field) {
      if(scope.errors[field.toLowerCase()]) {
        $("#Input" + field).tooltip('destroy');
        scope.errors[field.toLowerCase()] = false
      }
    };

    scope.guardarFamilia = function() {
      $http.post('/families.json', { family: scope.familyForm })
        .success(function(data){
          $state.go('familias', { alertaCreado: 'true' });
        })
        .error(function(data) {
          scope.errors = data.errors;

          for(var error in scope.errors) {
            if(scope.errors[error]) {
              $("#Input" + $rootScope.capitalize(error))
                  .tooltip({trigger: 'manual', title: scope.errors[error].join(', ')}).tooltip('show');
            }
          }
        });
    };

    scope.actualizarFamilia = function() {
      $http.put("/familias/" + $state.params.id + ".json",{familia: scope.familyForm})
        .success(function() {
          $state.go("familias", {id: $state.params.id});
          scope.errors = {};
        })
        .error(function(data) {
          scope.errors = data.errors;

          for(var error in scope.errors) {
            if(scope.errors[error]) {
              $("#Input" + $rootScope.capitalize(error))
                .tooltip({trigger: 'manual', title: scope.errors[error].join(', ')}).tooltip('show');
            }
          }
        });
    };

    scope.actionForm = scope.guardarFamilia;

    if ($state.params.id != undefined) {
      scope.actionForm = scope.actualizarFamilia;
      $http.get('/families/' + $state.params.id + '.json')
      .success(function(data){
        scope.familyForm = data.family;
        $rootScope.prolibertas = "Editar Familia"
      });
    }
    else {
      scope.actionForm = scope.guardarFamilia;
      $rootScope.prolibertas = "Crear Familia"
    }

  }]);
})();
