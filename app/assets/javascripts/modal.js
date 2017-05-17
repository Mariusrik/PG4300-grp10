/**
 * Created by aodegaar on 17.05.2017.
 */
$(document).ready(function(){
    $("#loginButton").click(function(){
        $("#login_modal").modal();
    });
});

$(document).ready(function(){
$('#submit_login').click(function() {
        $('#login_modal').modal('hide');
    });
});