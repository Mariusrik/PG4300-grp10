/**
 * Created by aodegaar on 17.05.2017.
 */
$(document).ready(function(){
    $("#loginButton").click(function(){
        $("#login_modal").modal();
    });
    $('#submit_login').click(function() {
        $('#login_modal').modal('hide');
    });
});
