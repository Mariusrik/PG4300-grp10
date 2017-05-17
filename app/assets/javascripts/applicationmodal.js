/**
 * Created by aodegaar on 17.05.2017.
 */

$(document).on('ready turbolinks:load', function() {

    $("#loginButton").click(function(){
        $("#login_modal").modal();
    });
    $('#submit_login').click(function() {
        $('#login_modal').modal('hide');
    });

});

document.addEventListener("turbolinks:load", function() {

    $("#loginButton").click(function(){
        $("#login_modal").modal();
    });
    $('#submit_login').click(function() {
        $('#login_modal').modal('hide');
    });

});

$( document ).on('turbolinks:load', function() {
    console.log("It works on each visit!")
});