<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发现 - 用思想创造价值 - 智能管车</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/project-notice.css">
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
                        <h1>{%$params['userName']%} / {%$params['projectName']%}</h1>
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
                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation"><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}"><span class="glyphicon glyphicon-home"></span> 主页</a></li>
                        <li role="presentation" class="active"><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/notice"><span class="glyphicon glyphicon-time"></span> 活动</a></li>
                        <li role="presentation"><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/wiki"><span class="glyphicon glyphicon-th-list"></span> Wiki</a></li>
                        <li class="nav-divider"></li>
                        <li role="presentation"><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/requirement"><span class="glyphicon glyphicon-list-alt"></span> 需求 <span class="badge">12</span></a></li>
                        <li role="presentation"><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/module"><span class="glyphicon glyphicon-th-large"></span> 模块 <span class="badge">2</span></a></li>
                        <li role="presentation"><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/task"><span class="glyphicon glyphicon-check"></span> 任务 <span class="badge">4</span></a></li>
                        <li role="presentation"><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/bug"><span class="glyphicon glyphicon-question-sign"></span> 问题 <span class="badge">284</span></a></li>
                        <li class="nav-divider"></li>
                        <li role="presentation"><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/release"><span class="glyphicon glyphicon-gift"></span> 发布</a></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-file"></span> 文档</a></li>
                    </ul>
                </div>
                <div class="col-md-10">
                    <ol class="breadcrumb">
                        <li><a href="">主页</a></li>
                        <li class="active">活动</li>
                    </ol>
                    <div class="row">
                        <div class="col-md-12">
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
                                            <p><a href="#">李翌文</a> 对 <a href="#">智能管车</a> 有新评论</p>
                                            <div class="row">
                                                <div class="col-md-1">
                                                    <a href=""><img class="img-circle" src="/assets/images/468149.png" width="40" height="40"></a>
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
                                                    <a href=""><img class="img-circle" src="/assets/images/468149.png" width="40" height="40"></a>
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
            </div>
        </div>
        {%include file="std_footer.tpl"%}
    </div>
</div>

</body>
</html>
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>