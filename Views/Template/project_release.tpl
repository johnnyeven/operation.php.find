<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发现 - 用思想创造价值 - 智能管车</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/project-release.css">
    <link rel="stylesheet" href="/assets/css/select2.min.css">
    <link rel="stylesheet" href="/assets/css/timeline.css">
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

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1 class="navbar-brand">发现 <small>用思想创造价值</small></h1>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse">
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="搜索">
                        </div>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="#">首页</a></li>
                        <li><a href="#">协作平台</a></li>
                        <li><a href="#">关于我们</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

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
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-home"></span> 主页</a></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-time"></span> 活动</a></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-th-list"></span> Wiki</a></li>
                        <li class="nav-divider"></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-list-alt"></span> 需求 <span class="badge">12</span></a></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-th-large"></span> 模块 <span class="badge">2</span></a></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-check"></span> 任务 <span class="badge">4</span></a></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-question-sign"></span> 问题 <span class="badge">284</span></a></li>
                        <li class="nav-divider"></li>
                        <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-gift"></span> 发布</a></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-file"></span> 文档</a></li>
                    </ul>
                </div>
                <div class="col-md-10">
                    <ol class="breadcrumb">
                        <li><a href="">主页</a></li>
                        <li class="active">发布</li>
                    </ol>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><span class="glyphicon glyphicon-gift"></span> 发布</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="timeline">
                                        <div class="year">
                                            <div class="list">
                                                <ul>
                                                    <li class="cls highlight">
                                                        <p class="date"><a href="#">3月26日<i></i></a></p>
                                                        <p class="intro"><a href="#">v1.6.0</a><br></p>
                                                        <p class="author">由 <a href="#">李翌文</a> 发布于 <small>2015-03-26 17:25</small></p>
                                                        <p class="version">
                                                            <span class="label label-success"><span class="glyphicon glyphicon-tag"></span> v1.6.0</span>
                                                            <span class="label label-success">最新</span>
                                                        </p>
                                                        <div class="more">
                                                            <p><a href="#">#10001</a> 修正车老板App登录信息丢失的bug</p>
                                                            <p><a href="#">#10002</a> 修正搜索结果显示异常的bug</p>
                                                            <p><a href="#">#10015</a> 修正翻页效果会使CPU占用过高的bug</p>
                                                            <p><a href="#">#10017</a> 修正获取消费明细接口偶尔会抛出异常的bug</p>
                                                            <p><a href="#">#10027</a> 修正同步消费明细无法正常执行的bug</p>
                                                            <p><a href="#">#10053</a> 修正分批次同步ETC卡会漏卡的bug</p>
                                                            <p><a href="#">#10068</a> 修正山东高速接口调用延迟太高的bug</p>
                                                            <p><a href="#">#10069</a> 修正G7支付回调接口抛出异常的bug</p>
                                                        </div>
                                                    </li>
                                                    <li class="cls">
                                                        <p class="date"><a href="#">3月19日<i></i></a></p>
                                                        <p class="intro"><a href="#">v1.5.5</a></p>
                                                        <p class="author">由 <a href="#">李翌文</a> 发布于 <small>2015-03-19 12:31</small></p>
                                                        <p class="version"><span class="label label-default"><span class="glyphicon glyphicon-tag"></span> v1.5.5</p>
                                                        <div class="more">
                                                            <p><a href="#">#10001</a> 修正车老板App登录信息丢失的bug</p>
                                                            <p><a href="#">#10002</a> 修正搜索结果显示异常的bug</p>
                                                            <p><a href="#">#10015</a> 修正翻页效果会使CPU占用过高的bug</p>
                                                            <p><a href="#">#10017</a> 修正获取消费明细接口偶尔会抛出异常的bug</p>
                                                            <p><a href="#">#10027</a> 修正同步消费明细无法正常执行的bug</p>
                                                            <p><a href="#">#10053</a> 修正分批次同步ETC卡会漏卡的bug</p>
                                                            <p><a href="#">#10068</a> 修正山东高速接口调用延迟太高的bug</p>
                                                            <p><a href="#">#10069</a> 修正G7支付回调接口抛出异常的bug</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <nav>
                                        <ul class="pager">
                                            <li class="disabled"><a href="#">上一页</a></li>
                                            <li><a href="#">下一页</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="mastfoot">
            <div class="inner">
                <p>Copyright &copy; 2015 Johnny Lee</p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>