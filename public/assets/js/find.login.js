require.config({
    baseUrl: 'assets/js',
    paths: {
        jquery: 'jquery-1.11.3.min',
        'jquery.zebra': 'zebra_dialog',
        'jquery.blockUI': 'jquery.blockUI',
        findApp: 'find.base'
    },
    //shim: {
    //    'jquery.zebra': {
    //        deps: [
    //            'jquery',
    //            'text!assets/css/zebra/zebra_dialog.css'
    //        ]
    //    }
    //}
});

require(['jquery', 'jquery.zebra', 'jquery.blockUI', 'findApp'], function ($, zebra, block, app) {
    $(function() {
        $("#btnLogin").click(function() {
            $.blockUI({
                message: null
            });
            var url = app.getFormAction($(this));
            app.load({
                url: url,
                params: {
                    'username': $("#iptUsername").val(),
                    'password': $("#iptPassword").val()
                },
                onSuccess: function(result) {
                    app.popSuccess('登录成功');
                    location.href = app.getAppUrl() + result.account.identifier;
                }
            });
        });
    });
});