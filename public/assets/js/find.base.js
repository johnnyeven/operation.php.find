function App() {
    this.appUrl = this.getAppUrl();
}

App.prototype = {
    start: function(nprogress) {
        $("#find-body").fadeIn();
        this.initUI();

        var that = this;
        $.pjax({
            timeout: 600000,
            selector: 'a.pjax',
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
        var that = this;
        var resizeHandler = function() {
            var clientHeight = $(window).height() - 50;
            $("#workarea").height(clientHeight);
        };
        window.onresize = resizeHandler;
        resizeHandler();

        Messenger.options = {
            extraClasses: 'messenger-fixed messenger-on-bottom messenger-on-right',
            theme: 'air'
        };

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

        if($("#optDisplayType").length > 0) {
            $("#optDisplayType > button").click(function() {
                var current = that.getCurrentUrl();
                var seperator = '';
                if(current.param != '') {
                    var replace = [
                        "?view=parallel",
                        "&view=parallel",
                        "?view=inline",
                        "&view=inline"
                    ];
                    for(var i in replace) {
                        current.param = current.param.replace(replace[i], "");
                    }
                }
                if(current.param != '') {
                    seperator = '&';
                } else {
                    seperator = '?';
                }
                var url = '';
                if($(this).attr("data-content") == '1') {
                    url = seperator + 'view=parallel';
                } else {
                    url = seperator + 'view=inline';
                }
                that.redirectByPjax(current.url + current.param + url);
            });
        }

        if($("#find-main.find-project-commit").length > 0) {
            var scroll = $("#find-main").getNiceScroll(0);
            var loading = false;
            var nextPage = 2;
            scroll.scrollend(function(){
                if(Math.abs(scroll.scrollvaluemax - scroll.scroll.y) < 20) {
                    var href = that.getCurrentUrl();
                    if(!loading) {
                        that.load(href.url + '.json' + href.param, {
                            page: nextPage,
                            limit: 10
                        }, 'GET', true, function(data) {
                            loading = false;
                            nextPage++;
                            var html = '';
                            var userName = data.userIdentifier;
                            var projectName = data.projectIdentifier;
                            data = data.commits;
                            for(var date in data) {
                                html += '\
                                <div class="row find-commit-row">\
                                    <div class="col-lg-2">\
                                    <h5><span class="glyphicon glyphicon-calendar"></span> ' + date + '</h5>\
                                    <p class="find-commit-count"><small>' + data[date].length + ' commit' + (data[date].length > 1 ? 's' : '') + '</small></p>\
                                </div>\
                                <div class="col-lg-10">\
                                    <ul class="find-borderd-list">';
                                for(var i in data[date]) {
                                    html += '<li>\
                                        <div class="find-commit-message">\
                                            <strong><a href="' + that.getAppUrl() + userName + '/' + projectName + '/commit/' + data[date][i].hash + '">' + data[date][i].message + '</a></strong>\
                                            <span class="pull-right"><a href="' + that.getAppUrl() + userName + '/' + projectName + '/commit/' + data[date][i].hash + '">' + data[date][i].shorthash + '</a></span>\
                                        </div>\
                                        <div class="find-commit-user">\
                                            <img src="/assets/img/468149.png" class="img-circle" width="32" height="32">\
                                            <a href="#">' + data[date][i].author.name + '</a> 上传于 ' + data[date][i].time + '\
                                            <span class="pull-right find-commit-browse"><a href="' + that.getAppUrl() + userName + '/' + projectName + '/tree/' + data[date][i].hash + '">浏览代码 <span class="glyphicon glyphicon-chevron-right"></span></a></span>\
                                        </div>\
                                    </li>';
                                }
                                html += '\
                                    </ul>\
                                </div>\
                            </div>\
                            <hr>';
                            }
                            $("#find-commit-container").append(html);
                        }, function(result) {
                            that.popError(result.message);
                            loading = false;
                        });
                        loading = true;
                    }
                }
            });
        }

        if($("#compare").length > 0) {
            $("#btnCompareExchange").click(function() {
                var tmp = $("#sourceRef").val();
                $("#sourceRef").selectpicker("val", $("#targetRef").val());
                $("#targetRef").selectpicker("val", tmp);
            });
            $("#btnCompare").click(function() {
                var sourceRef = $("#sourceRef").val();
                var targetRef = $("#targetRef").val();
                var url = that.getFormAction($(this));
                that.redirectByPjax(url + sourceRef + "..." + targetRef);
            });
        }

        if($("#iptComment").length > 0) {
            $("#iptComment").markdown();
        }

        if($("#formProcessMerge").length > 0) {
            $("#btnAcceptMerge").click(function() {
                $("#formProcessMerge > input[name='type']").val("1");
                $("#formProcessMerge").submit();
            });
            $("#btnDenyMerge").click(function() {
                $("#formProcessMerge > input[name='type']").val("2");
                $("#formProcessMerge").submit();
            });
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

    redirectByPjax: function(url) {
        var html = '<a id="optDisplayTypeHref" class="pjax" href="' + url + '" style="display:none;"></a>';
        $("body").append(html);
        $("#optDisplayTypeHref").click();
        $("#optDisplayTypeHref").remove();
    },

    getCurrentUrl: function() {
        var href = window.location.href;
        var match = href.match(/^(.*)([\?#].*)$/);
        if(match) {
            return {
                url: match[1],
                param: match[2]
            };
        } else {
            return {
                url: href,
                param: ''
            };
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

    load: function(url, params, method, modal, onSuccess, onError, onLoadBefore, onLoadComplete, timeout) {
        if(typeof url == 'object') {
            var config = url;
            url = config.url;
            params = config.params;
            method = config.method;
            modal = config.modal;
            onSuccess = config.onSuccess;
            onError = config.onError;
            onLoadBefore = config.onLoadBefore;
            onLoadComplete = config.onLoadComplete;
            timeout = config.timeout;
        }

        params = params || {};
        method = method || 'GET';
        modal = modal || true;
        onSuccess = onSuccess || false;
        onError = onError || false;
        onLoadBefore = onLoadBefore || false;
        onLoadComplete = onLoadComplete || false;
        timeout = timeout || 60 * 1000;
        self = this;

        if(url) {
            if(modal) {
                $.blockUI({
                    message: '',
                    css: {

                    }
                });
            }
            $.ajax({
                timeout : timeout,
                type : method,
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
                            self.popError('json无效，数据为空');
                            return false;
                        }
                        try {
                            result = eval('(' + json + ')');
                        } catch (e) {
                            if (typeof console.log != 'undefined') {
                                console.log(json);
                            }
                            self.popError('服务器返回数据无法解析');
                            return false;
                        }
                    } else {
                        result = json;
                    }

                    if ((result != null && result.code != 0) ||
                    result.data == undefined) {
                        if(!result.message) {
                            result.message = '没有获取到数据';
                        }
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

    popSuccess: function(message, actions, autoHide) {
        this.popMessage(message, 'success', actions, autoHide);
    },

    popError: function(message, actions, autoHide) {
        this.popMessage(message, 'error', actions, autoHide);
    },

    popAlert: function(message, actions, autoHide) {
        this.popMessage(message, 'info', actions, autoHide);
    },

    popMessage: function(message, type, actions, autoHide) {
        //if(message) {
            //$.Zebra_Dialog(message, {
            //    type: type || 'information',
            //    buttons:  false,
            //    modal: false,
            //    position: ['right - 20', 'top + 20'],
            //    auto_close: 2000
            //});
        autoHide = autoHide || 5;
            var msg = Messenger().post({
                message: message,
                type: type || "info",
                hideAfter: autoHide,
                actions: actions
                //actions: {
                //    ok: {
                //        label: '立即创建',
                //        action: function() {}
                //    },
                //    cancel: {
                //        label: "取消",
                //        action: function() {
                //            return msg.cancel();
                //        }
                //    }
                //}
            });
        //}
    }
}

var app = new App();
if ( typeof define === "function" && define.amd && define.amd.jQuery ) {
    define( "findApp", ['jquery', 'pjax', 'messenger.min', 'jquery.blockUI'],  function () { return app; } );
}