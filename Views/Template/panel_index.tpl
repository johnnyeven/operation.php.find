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
                                <li role="presentation" class="active"><a href="#all" data-toggle="tab" aria-controls="all">所有</a></li>
                                <li role="presentation"><a href="#mine" data-toggle="tab" aria-controls="mine">我创建的</a></li>
                                <li role="presentation"><a href="#other" data-toggle="tab" aria-controls="other">他人的</a></li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="all">
                                <ul class="list-group">
                                    {%foreach $params['projects'] as $project%}
                                        <li class="list-group-item">
                                            <a href="{%baseUrl($params['account']->identifier|cat:'/'|cat:$project->identifier)%}">
                                                <span class="glyphicon glyphicon-book" aria-hidden="true"></span>
                                                {%$project->name%}
                                            </a>
                                        </li>
                                    {%/foreach%}
                                    {%foreach $params['otherProjects'] as $project%}
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
                            <div class="tab-pane fade" id="mine">
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
                            <div class="tab-pane fade" id="other">
                                <ul class="list-group">
                                    {%foreach $params['otherProjects'] as $project%}
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
                    </div>
                </div>
                <div class="col-md-8">
                    <ul class="list-group">
                        {%foreach $params['notices'] as $notice%}
                        <li class="list-group-item">
                            {%$notice->format()%}
                        </li>
                        {%/foreach%}
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
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>