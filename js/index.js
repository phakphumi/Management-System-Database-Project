function loginBtn() {
    $("#loginBtn").on("click",function(e) {
        var type = $("#lunch").val();
        var web = {'staff':'staff.html','instructor':'instructor.html','principle':'principle.html'};
        window.open(web[type], '_self');
    });
}
$(function() {
    loginBtn();
});
