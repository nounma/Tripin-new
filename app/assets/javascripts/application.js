//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require select2-full
//= require jquery-ui

//= require_tree .

$(document).on("page:load ready", function(){
    $("input.datepicker").datepicker();
});
