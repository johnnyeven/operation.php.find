<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发现 - 用思想创造价值 - 智能管车</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/project-index.css">
    <link rel="stylesheet" href="/assets/css/markdown-theme-dawn.css">
    <link rel="stylesheet" href="/assets/css/desert-cmd.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="with-shadow"></div>
<div class="container-fluid site-wrapper">
    <div class="nest-container">

        {%include file="std_nav.tpl"%}
        <div class="spaceholder"></div>

        <div class="project-content container">
            <div class="row project-title">
                <div class="col-md-12">
                    <div class="pull-left">
                        {%include file="project_title.tpl"%}
                    </div>
                    <div class="pull-right">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-danger active">取消关注</button>
                            <button type="button" class="btn btn-danger">申请加入</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    {%include file="project_sidebar.tpl"%}
                </div>
                <div class="col-md-10">
                    <ol class="breadcrumb">
                        <li class="active">主页</li>
                    </ol>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><span class="glyphicon glyphicon-user"></span> 成员 <span class="badge">{%$params['memberCount']%}</span></h3>
                                </div>
                                <ul class="list-group">
                                    {%foreach $params['roles'] as $name => $members%}
                                    <li class="list-group-item">{%$name%}
                                        {%foreach $members as $member%}
                                            <a href="#">{%$member->realname%}</a>
                                        {%/foreach%}
                                    </li>
                                    {%/foreach%}
                                    <li class="list-group-item"><button class="btn btn-info form-control">查看全部</button></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><span class="glyphicon glyphicon-time"></span> 活动</h3>
                                </div>
                                <ul class="list-group">
                                    {%foreach $params['notices'] as $notice%}
                                    {%$notice->format(TRUE)%}
                                    {%/foreach%}
                                    <li class="list-group-item"><button class="btn btn-info form-control">查看全部</button></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><span class="glyphicon glyphicon-heart"></span> 项目介绍</h3>
                                </div>
                                <div id="readme-markdown" class="panel-body markdown-content">{%$params['readme']%}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {%include file="std_footer.tpl"%}
    </div>
</div>

</body>
</html>
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/assets/js/markdown.min.js"></script>
<script type="text/javascript" src="/assets/js/prettify/prettify.js"></script>
<script type="text/javascript" src="/assets/js/project.index.js"></script>