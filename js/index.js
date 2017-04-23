function loginBtn() {
    $("#loginBtn").on("click",function(e) {
        var type = $("#lunch").val();
        var userID = $("#userID").val();

        var web = {'staff':'staffTable.html','instructor':'instructor.html','principle':'principle.html'};
        window.open(web[type], '_self');

        $.post("./backends/login.php",
        {
            id: userID,
            user_type: type
        },
        function(data, status){
            console.log("login response \nData: " + data + "\nStatus: " + status);
        });

    });
}
$(function() {
    loginBtn();
});
