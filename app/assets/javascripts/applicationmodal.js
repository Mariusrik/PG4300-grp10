/**
 * Created by aodegaar on 17.05.2017.
 */

$(document).on('turbolinks:load', function() {

    $("#loginButton").click(function(){
        $("#login_modal").modal();
    });
    $('#submit_login').click(function() {
        $('#login_modal').modal('hide');
    });

});