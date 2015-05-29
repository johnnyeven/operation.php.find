<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发现 - 用思想创造价值 - 智能管车</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/project-task.css">
    <link rel="stylesheet" href="/assets/css/select2.min.css">
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
                        <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-check"></span> 任务 <span class="badge">4</span></a></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-question-sign"></span> 问题 <span class="badge">284</span></a></li>
                        <li class="nav-divider"></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-gift"></span> 发布</a></li>
                        <li role="presentation"><a href="#"><span class="glyphicon glyphicon-file"></span> 文档</a></li>
                    </ul>
                </div>
                <div class="col-md-10">
                    <ol class="breadcrumb">
                        <li><a href="">主页</a></li>
                        <li class="active">任务</li>
                    </ol>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><span class="glyphicon glyphicon-check"></span> 任务</h3>
                                </div>
                                <table class="table table-hover table-bordered table-condensed">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox"> 编号</th>
                                            <th>标题</th>
                                            <th>状态</th>
                                            <th>模块</th>
                                            <th>提出方</th>
                                            <th>指派给</th>
                                            <th>开始时间</th>
                                            <th>计划完成时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="danger">
                                            <td><input type="checkbox"> 10001</td>
                                            <td>微众卡管理</td>
                                            <td>新建</td>
                                            <td><a href="#">微众卡管理</a></td>
                                            <td>项目经理</td>
                                            <td>李翌文</td>
                                            <td>2015-04-16</td>
                                            <td>2015-05-16</td>
                                            <td class="text-center">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                        <span class="glyphicon glyphicon-wrench"></span> <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><span class="glyphicon glyphicon-edit"></span> 编辑</a></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-hand-right"></span> 指派给</a></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-hand-left"></span> 提出方</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-remove"></span> 删除</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"> 10002</td>
                                            <td>订单管理</td>
                                            <td>已关闭</td>
                                            <td><a href="#">订单管理</a></td>
                                            <td>项目经理</td>
                                            <td>李翌文</td>
                                            <td>2015-04-16</td>
                                            <td>2015-05-16</td>
                                            <td class="text-center">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                        <span class="glyphicon glyphicon-wrench"></span> <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><span class="glyphicon glyphicon-edit"></span> 编辑</a></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-hand-right"></span> 指派给</a></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-hand-left"></span> 提出方</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-remove"></span> 删除</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="success">
                                            <td><input type="checkbox"> 10003</td>
                                            <td>ETC消费记录管理</td>
                                            <td>已解决</td>
                                            <td><a href="#">ETC消费记录管理</a></td>
                                            <td>项目经理</td>
                                            <td>李翌文</td>
                                            <td>2015-04-16</td>
                                            <td>2015-05-16</td>
                                            <td class="text-center">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                        <span class="glyphicon glyphicon-wrench"></span> <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><span class="glyphicon glyphicon-edit"></span> 编辑</a></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-hand-right"></span> 指派给</a></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-hand-left"></span> 提出方</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-remove"></span> 删除</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="info">
                                            <td><input type="checkbox"> 10004</td>
                                            <td>ETC卡管理</td>
                                            <td>处理中</td>
                                            <td><a href="#">ETC卡管理</a></td>
                                            <td>项目经理</td>
                                            <td>李翌文</td>
                                            <td>2015-04-16</td>
                                            <td>2015-05-16</td>
                                            <td class="text-center">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                        <span class="glyphicon glyphicon-wrench"></span> <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><span class="glyphicon glyphicon-edit"></span> 编辑</a></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-hand-right"></span> 指派给</a></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-hand-left"></span> 提出方</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-remove"></span> 删除</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="warning">
                                            <td><input type="checkbox"> 10005</td>
                                            <td>开发框架搭建</td>
                                            <td>反馈</td>
                                            <td><a href="#">开发框架搭建</a></td>
                                            <td>项目经理</td>
                                            <td>李翌文</td>
                                            <td>2015-04-16</td>
                                            <td>2015-05-16</td>
                                            <td class="text-center">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                        <span class="glyphicon glyphicon-wrench"></span> <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><span class="glyphicon glyphicon-edit"></span> 编辑</a></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-hand-right"></span> 指派给</a></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-hand-left"></span> 提出方</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#"><span class="glyphicon glyphicon-remove"></span> 删除</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="row table-footer">
                                    <div class="col-md-6">
                                        每页显示
                                        <select id="optPageSize">
                                            <option>10</option>
                                            <option selected>20</option>
                                            <option>50</option>
                                            <option>100</option>
                                        </select>
                                        条
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <nav>
                                            <ul class="pagination">
                                                <li class="disabled">
                                                    <a href="#" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <li class="active"><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#">5</a></li>
                                                <li>
                                                    <a href="#" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
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
<script type="text/javascript" src="/assets/js/select2.full.min.js"></script>
<script type="text/javascript" src="/assets/js/project-task.js"></script>