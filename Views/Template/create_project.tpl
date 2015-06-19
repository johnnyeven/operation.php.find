<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>开启一个新项目</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/create-project.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="container-fluid site-wrapper with-shadow">
    <div class="nest-container">

        {%include file="std_nav.tpl"%}
        <div class="create-project-content">
            <div class="create-project-container">
                <div class="create-project-panel">
                    <form method="get" action="{%baseUrl('johnnyeven')%}">
                        <h3>开启新项目</h3>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="iptOwner">所有者</label>
                                    <input type="text" class="form-control" id="iptOwner" name="iptOwner" value="{%$params['account']->realname%}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="iptProjectName">项目名称</label>
                                    <input type="text" class="form-control" id="iptProjectName" name="iptProjectName">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="iptPermalink">固定链接</label>
                            <div class="input-group">
                                <span class="input-group-addon">{%baseUrl($params['account']->identifier)%}/</span>
                                <input type="text" class="form-control" id="iptPermalink" name="iptPermalink" value="truck">
                            </div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <div class="radio">
                                <label class="control-label">
                                    <input type="radio" name="optPermission" id="optPermissionPublic" value="0" checked>
                                    <p class="lead"><span class="glyphicon glyphicon-book"></span> 公开</p>
                                    <p class="help-block">其他人能够搜索到你项目并且查看项目内容</p>
                                </label>
                            </div>
                            <div class="radio">
                                <label class="control-label">
                                    <input type="radio" name="optPermission" id="optPermissionPrivate" value="1">
                                    <p class="lead"><span class="glyphicon glyphicon-lock"></span> 私有</p>
                                    <p class="help-block">其他人无法搜索到你项目的一切</p>
                                </label>
                            </div>
                        </div>
                        <div class="form-group clearfix">
                            <button type="submit" class="btn btn-success pull-right ">创建</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        {%include file="std_footer.tpl"%}
    </div>
</div>

</body>
</html>
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/assets/js/create-project.js"></script>