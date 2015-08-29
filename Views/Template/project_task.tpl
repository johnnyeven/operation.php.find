<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>发现 - 李翌文</title>
	<link rel="shortcut icon" href="/assets/img/gt_favicon.png">
	<!--[if lt IE 9]> <script src="/assets/js/html5shiv.js"></script> <![endif]-->
</head>
<body>
<script src="/assets/js/require.js" data-main="/assets/js/find.project-task.js"></script>
<script src="/assets/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/assets/js/jquery.pjax.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).pjax('a', 'body');
</script>

<div class="container-fluid">
	{%include file="std_nav.tpl"%}
	<div class="container-fluid find-container">
		<div id="workarea" class="row">
			<div class="col-md-2 find-sidebar" id="find-sidebar">
				{%include file="project_sidebar.tpl"%}
			</div>
			<div class="col-md-2 find-sub-sidebar" id="find-sub-sidebar">
				{%include file="project_manage_sub_sidebar.tpl"%}
			</div>
			<div class="col-md-8 find-main" id="find-main">
				<div class="row find-project-main-title">
					<div class="col-sm-9">
						需求管理
					</div>
					<div class="col-sm-3 text-right">
						<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 新建需求</button>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading cursor" role="tab" id="headingOne" data-toggle="collapse" href="#colCondition" aria-expanded="true" aria-controls="collapseOne">
								<h4 class="panel-title">查询条件</h4>
							</div>
							<div id="colCondition" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<form>
										<div class="row find-manage-condition">
											<div class="col-sm-2 find-manage-condition-item">
												<strong>编号</strong>
											</div>
											<div class="col-sm-3 find-manage-condition-item">
												<select id="sltOperation1" class="selectpicker show-tick" data-width="100%" data-size="5">
													<option>等于</option>
												</select>
											</div>
											<div class="col-sm-6 find-manage-condition-item">
												<input type="text" class="form-control" id="iptValue1" placeholder="">
											</div>
											<div class="col-sm-1 find-manage-condition-item">
												<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											</div>
										</div>
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">应用</button>
											<button type="button" class="btn btn-danger">清除</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">提交<span class="badge">5</span></h3>
							</div>
							<ul class="list-group">
								<li class="list-group-item">
									<div class="find-commit-message">
										<strong><span class="label label-danger">新建</span> <a href="#">Remove user OAuth tokens stored in database for Bitbucket...</a></strong>
										<span class="pull-right">#43987</span>
									</div>
									<div class="find-commit-user">
										<img src="/assets/img/468149.png" class="img-circle" width="16" height="16">
										<a href="#">李翌文</a> 发表于2天前 <span class="glyphicon glyphicon-edit"></span> <a href="#">李翌文</a> 更新于2天前
										<span class="pull-right find-commit-browse"><a href="#">浏览模块 <span class="glyphicon glyphicon-chevron-right"></span></a></span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="find-commit-message">
										<strong><span class="label label-success">解决</span> <a href="#">Remove user OAuth tokens stored in database for Bitbucket...</a></strong>
										<span class="pull-right">#43988</span>
									</div>
									<div class="find-commit-user">
										<img src="/assets/img/468149.png" class="img-circle" width="16" height="16">
										<a href="#">李翌文</a> 发表于2天前 <span class="glyphicon glyphicon-edit"></span> <a href="#">李翌文</a> 更新于2天前
										<span class="pull-right find-commit-browse"><a href="#">浏览模块 <span class="glyphicon glyphicon-chevron-right"></span></a></span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="find-commit-message">
										<strong><span class="label label-info">处理</span> <a href="#">Remove user OAuth tokens stored in database for Bitbucket...</a></strong>
										<span class="pull-right">#43988</span>
									</div>
									<div class="find-commit-user">
										<img src="/assets/img/468149.png" class="img-circle" width="16" height="16">
										<a href="#">李翌文</a> 发表于2天前 <span class="glyphicon glyphicon-edit"></span> <a href="#">李翌文</a> 更新于2天前
										<span class="pull-right find-commit-browse"><a href="#">浏览模块 <span class="glyphicon glyphicon-chevron-right"></span></a></span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="find-commit-message">
										<strong><span class="label label-warning">反馈</span> <a href="#">Remove user OAuth tokens stored in database for Bitbucket...</a></strong>
										<span class="pull-right">#43988</span>
									</div>
									<div class="find-commit-user">
										<img src="/assets/img/468149.png" class="img-circle" width="16" height="16">
										<a href="#">李翌文</a> 发表于2天前 <span class="glyphicon glyphicon-edit"></span> <a href="#">李翌文</a> 更新于2天前
										<span class="pull-right find-commit-browse"><a href="#">浏览模块 <span class="glyphicon glyphicon-chevron-right"></span></a></span>
									</div>
								</li>
								<li class="list-group-item">
									<div class="find-commit-message">
										<strong><span class="label label-default">关闭</span> <a href="#">Remove user OAuth tokens stored in database for Bitbucket...</a></strong>
										<span class="pull-right">#43988</span>
									</div>
									<div class="find-commit-user">
										<img src="/assets/img/468149.png" class="img-circle" width="16" height="16">
										<a href="#">李翌文</a> 发表于2天前 <span class="glyphicon glyphicon-edit"></span> <a href="#">李翌文</a> 更新于2天前
										<span class="pull-right find-commit-browse"><a href="#">浏览模块 <span class="glyphicon glyphicon-chevron-right"></span></a></span>
									</div>
								</li>
							</ul>
						</div>
						<nav class="text-center">
							<ul class="pagination">
								<li>
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

</body>
</html>