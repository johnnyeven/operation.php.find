function App() {
    this.appUrl = this.getAppUrl();
}

App.prototype = {
    start: function(nprogress) {
        $("#find-body").fadeIn();
        this.initUI();

        var that = this;
        $.pjax({
            timeout: 60000,
            selector: 'a',
            container: 'body',
            show: '',
            cache: false,
            storage: false,
            titleSuffix: '',
            //filter: function(){},
            callback: function(){
                that.initUI();
            }
        });
        $(document).on('pjax.start', function() { nprogress.start(); });
        $(document).on('pjax.end',   function() { nprogress.done();  });
    },
    initUI: function() {
        var resizeHandler = function() {
            var clientHeight = $(window).height() - 50;
            $("#workarea").height(clientHeight);
        };
        window.onresize = resizeHandler;
        resizeHandler();

        $("select.selectpicker").selectpicker();
        $(".nicescroll").niceScroll({
            cursorcolor: "#666",
            cursorborder: "none"
        });
        $("#find-main").niceScroll({
            cursorcolor: "#666",
            cursorborder: "none",
            mousescrollstep: 50
        });
        $("#find-sidebar").niceScroll({
            cursorcolor: "#666",
            cursorborder: "none"
        });
        $("#find-sub-sidebar").niceScroll({
            cursorcolor: "#ccc",
            cursorborder: "none"
        });

        $('#illustration').hover( function(){
            $(this).addClass('expand');
        }, function(){
            $(this).removeClass('expand');
        });

        if($("#file-content").length > 0 && $("#file-type").length > 0) {
            if($("#file-type").text() != 'markdown') {
                require(['ace/build/src-min-noconflict/ace'], function($ace) {
                    var editor = ace.edit("file-content");
                    editor.setReadOnly(true);
                    editor.setShowPrintMargin(false);
                    editor.setTheme("ace/theme/github");
                    editor.session.setMode("ace/mode/" + $("#file-type").text());
                    editor.session.setUseWrapMode(true);
                    editor.setOptions({
                        maxLines: Infinity
                    });
                    editor.renderer.$cursorLayer.element.style.opacity=0;
                });
            }
        }

        prettyPrint();
    },
    getAppUrl: function() {
        var script = document.getElementsByTagName("script");
        for (var i = 0; i < script.length; i++) {
            var match = script[i].src.match(/find\.base\.js($|\?.*)/);
            if (match) {
                return script[i].src.replace(/assets\/js\/find\.base\.js.*/, '');
            }
        }
    },

    getFormAction: function(b) {
        if(typeof b == 'string') {
            b = $(b);
        }
        var form = b.closest('form');
        if(form.length > 0) {
            return form.attr('action');
        }
        return null;
    },

    load: function(url, params, onSuccess, onError, onLoadBefore, onLoadComplete, timeout) {
        if(typeof url == 'object') {
            var config = url;
            url = config.url;
            params = config.params;
            onSuccess = config.onSuccess;
            onError = config.onError;
            onLoadBefore = config.onLoadBefore;
            onLoadComplete = config.onLoadComplete;
            timeout = config.timeout;
        }

        params = params || {};
        onSuccess = onSuccess || false;
        onError = onError || false;
        onLoadBefore = onLoadBefore || false;
        onLoadComplete = onLoadComplete || false;
        timeout = timeout || 60 * 1000;
        self = this;

        if(url) {
            $.ajax({
                timeout : timeout,
                type : 'POST',
                url : url,
                data : params,
                processData: true,
                dataType: "json",
                beforeSend : function(XMLHttpRequest) {
                    if (onLoadBefore) {
                        onLoadBefore(XMLHttpRequest);
                    }
                },
                success: function(json) {
                    var result;
                    if (typeof json === "string") {
                        if (json.length < 1) {
                            self.showError(2, ['json无效，数据为空']);
                            return false;
                        }
                        try {
                            result = eval('(' + json + ')');
                        } catch (e) {
                            if (typeof console.log != 'undefined') {
                                console.log(json);
                            }
                            self.showError(2, ['服务器返回数据无法解析']);
                            return false;
                        }
                    } else {
                        result = json;
                    }

                    if (result != null && result.code != 0) {
                        if (onError) {
                            onError(result);
                        } else {
                            self.popError(result.message);
                        }
                        result = false;
                    } else {
                        if (onSuccess) {
                            onSuccess(result.data);
                        }
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    try {
                        if (XMLHttpRequest.status == 401) {
                            self.loadDataStatus = 401;
                            return false;
                        }
                        if (typeof self.loadDataStatus != 'undefined' &&
                            self.loadDataStatus == 401) {
                            self.popAlert('正在验证登录状态...');
                            return false;
                        }

                        if (onError) {
                            onError({
                                'XMLHttpRequest': XMLHttpRequest,
                                'textStatus': textStatus,
                                'errorThrown': errorThrown
                            });
                            return false;
                        }

                        if (XMLHttpRequest.status == 0) {
                            self.popError('获取数据失败, 网络异常, 请检查网络或重试操作!');
                            return false;
                        }

                        if (typeof console.error != 'undefined') {
                            console.error(XMLHttpRequest, textStatus, errorThrown);
                        }
                        self.popError('获取数据时发生错误, 错误编码: ' + XMLHttpRequest.status);
                    } catch (e) {
                        console.log(e);
                    }
                },
                complete: function(XMLHttpRequest, textStatus) {
                    $.unblockUI();
                    if (onLoadComplete) {
                        onLoadComplete(XMLHttpRequest, textStatus);
                    }
                }
            });
        }
    },

    popSuccess: function(message) {
        this.popMessage(message, 'confirmation');
    },

    popError: function(message) {
        this.popMessage(message, 'error');
    },

    popAlert: function(message) {
        this.popMessage(message);
    },

    popMessage: function(message, type) {
        if(message) {
            $.Zebra_Dialog(message, {
                type: type || 'information',
                buttons:  false,
                modal: false,
                position: ['right - 20', 'top + 20'],
                auto_close: 2000
            });
        }
    }
}

var app = new App();
if ( typeof define === "function" && define.amd && define.amd.jQuery ) {
    define( "findApp", ['jquery', 'pjax'],  function () { return app; } );
}