require.config({
    baseUrl: 'assets/js',
    paths: {
        'jquery': 'jquery-1.11.3.min',
        'jquery.zebra': 'zebra_dialog',
        'jquery.blockUI': 'jquery.blockUI',
        'findApp': 'find.base'
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
        $("#btnSubmit").click(function() {
            $.blockUI({
                message: null
            });
            var url = app.getFormAction($(this));
            app.load({
                url: url,
                params: {
                    'name': $("#iptProjectName").val(),
                    'identifier': $("#iptPermalink").val(),
                    'isPublic': $("input[name=optPermission]:selected").val()
                },
                onSuccess: function(result) {
                    app.popSuccess('创建项目成功，正在进入项目主页');
                    location.href = app.getAppUrl() + result.account.identifier + '/' + result.project.identifier;
                }
            });
        });
    });
});