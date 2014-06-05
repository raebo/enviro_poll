`$(document).ready(function(){
    $("#edit-button").click(function() {
        $.ajax({url: "authenticate/set_edit_var", type: "POST"});
    });
});`