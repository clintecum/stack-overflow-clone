$(document).ready(function() {
    $(".tabs li").on("click", function() {
        var clickedTab = $(this).find('a').attr("href");
        $(".tab").hide();
        $(".active").removeClass();
        $(clickedTab).show();
        $(this).addClass("active");
    });
});
