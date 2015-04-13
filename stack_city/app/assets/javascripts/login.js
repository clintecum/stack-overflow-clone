$(document).ready(function() {

    var button = $('#loginButton');
    var box = $('#loginBox');
    var form = $('#loginForm');
    button.removeAttr('href');
    button.mouseup(function(login) {
        box.toggle();
        button.toggleClass('active');
    });
    form.mouseup(function() {
        return false;
    });
    $(this).mouseup(function(login) {
        if (!($(login.target).parent('#loginButton').length > 0)) {
            button.removeClass('active');
            box.hide();
        }
    });
    $("button#logout_button").on("click", function(event) {
                console.log("Click");
                event.preventDefault();
                $.ajax({
                    type: "DELETE",
                    url: "/logout",
       });
    });
});