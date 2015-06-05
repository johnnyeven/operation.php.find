$(function() {
    $("#btnLogin").click(function() {
        var url = app.getFormAction($(this));
        app.load({
            url: url,
            params: {
                'username': $("#iptUsername").val(),
                'password': $("#iptPassword").val()
            },
            onSuccess: function(result) {
                app.popSuccess('登录成功');
            }
        });
    });
});
