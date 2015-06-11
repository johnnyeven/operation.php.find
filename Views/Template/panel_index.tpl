<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发现 - 用思想创造价值 - 李翌文的项目主页</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/panel-index.css">
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
        <div class="spaceholder"></div>

        <div class="panel-content container">
            <div class="row">
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading clearfix">
                            <h1 class="panel-title pull-left">你参与的项目 <span class="label label-default">42</span></h1>
                            <a class="btn btn-success pull-right" href="{%baseUrl('create')%}">创建新项目</a>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-pills">
                                <li role="presentation" class="active"><a href="#">所有</a></li>
                                <li role="presentation"><a href="#">我创建的</a></li>
                                <li role="presentation"><a href="#">他人的</a></li>
                            </ul>
                        </div>
                        <ul class="list-group">
                            {%foreach $params['projects'] as $project%}
                            <li class="list-group-item">
                                <a href="{%baseUrl($params['account']->identifier|cat:'/'|cat:$project->identifier)%}">
                                    <span class="glyphicon glyphicon-book" aria-hidden="true"></span>
                                    {%$project->name%}
                                </a>
                            </li>
                            {%/foreach%}
                            <li class="list-group-item readmore">
                                <a href="#">
                                    <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                    获取更多...
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-8">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-md-1">
                                    <span class="glyphicon glyphicon-star"></span>
                                </div>
                                <div class="col-md-11">
                                    <a href="#">李翌文</a> 关注了项目 <a href="#">智能管车</a>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-md-1">
                                    <span class="glyphicon glyphicon-comment"></span>
                                </div>
                                <div class="col-md-11">
                                    <p><small>3 天前</small></p>
                                    <p><a href="#">李翌文</a> 关注了项目 <a href="#">智能管车</a></p>
                                    <div class="row">
                                        <div class="col-md-1">
                                            <a href=""><img class="img-circle" src="assets/images/468149.png" width="40" height="40"></a>
                                        </div>
                                        <div class="col-md-11">
                                            <p>我觉得这个项目做的很不错！</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-md-1">
                                    <span class="glyphicon glyphicon-question-sign"></span>
                                </div>
                                <div class="col-md-11">
                                    <p><small>3 天前</small></p>
                                    <p><a href="#">李翌文</a> 将 <a href="#">智能管车</a> 问题 <a href="#">#40293</a> 状态变更为 处理中</p>
                                    <div class="row">
                                        <div class="col-md-1">
                                            <a href=""><img class="img-circle" src="assets/images/468149.png" width="40" height="40"></a>
                                        </div>
                                        <div class="col-md-11">
                                            <p><a href="#">#40293</a> 点击登录输入正确的用户名和密码也无法登录</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item text-center">
                            <button class="btn btn-success form-control">获取更多...</button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        {%include file="std_footer.tpl"%}
    </div>
</div>

</body>
</html>
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>