<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>发现 - 李翌文</title>
	<link rel="shortcut icon" href="/assets/img/gt_favicon.png">
</head>
<body id="find-body" style="display: none;">
<script src="/assets/js/require.js" data-main="/assets/js/find.account-index.js"></script>
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
				{%include file="panel_sidebar.tpl"%}
			</div>
			<div class="col-md-10 find-main" id="find-main">
				<div class="row row-padding">
					<div class="col-md-8">
						<div class="find-notice-checkbox">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-info">
									<input type="checkbox" autocomplete="off"><span class="glyphicon glyphicon-upload"></span> 推送通知
								</label>
								<label class="btn btn-info">
									<input type="checkbox" autocomplete="off"><span class="glyphicon glyphicon-download-alt"></span> 合并通知
								</label>
								<label class="btn btn-info">
									<input type="checkbox" autocomplete="off"><span class="glyphicon glyphicon-comment"></span> 评论通知
								</label>
								<label class="btn btn-info">
									<input type="checkbox" autocomplete="off"><span class="glyphicon glyphicon-th-list"></span> 管理通知
								</label>
							</div>
							<button type="button" class="btn btn-info pull-right"><span class="fa fa-rss"></span></button>
						</div>
						<ul class="account-notice-list">
							<li>
								<div class="account-notice-meta clearfix">
									<div class="account-notice-meta-title pull-left">
										<a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> 推送了 2 个提交到 <a href="3">feature/#43872</a>
									</div>
									<div class="account-notice-meta-time pull-right">
										6分钟前
									</div>
								</div>
								<div class="account-notice-content">
									<ul class="account-notice-content-list">
										<li><a href="#">4aef2781</a> - docker ssh connection times can be slow when UseDNS is enabled</li>
										<li><a href="#">4aef2781</a> - docker ssh connection times can be slow when UseDNS is enabled</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="account-notice-meta clearfix">
									<div class="account-notice-meta-title pull-left">
										<a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> 接受了 <a href="#">#43</a> 合并请求，来自 <a href="#">李翌文 / Operation.PHP</a>
									</div>
									<div class="account-notice-meta-time pull-right">
										6分钟前
									</div>
								</div>
								<div class="account-notice-content">
									合并两种支付方式
								</div>
							</li>
							<li>
								<div class="account-notice-meta clearfix">
									<div class="account-notice-meta-title pull-left">
										<a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> 推送了 2 个提交到 <a href="3">feature/#43872</a>
									</div>
									<div class="account-notice-meta-time pull-right">
										6分钟前
									</div>
								</div>
								<div class="account-notice-content">
									<ul class="account-notice-content-list">
										<li><a href="#">4aef2781</a> - docker ssh connection times can be slow when UseDNS is enabled</li>
										<li><a href="#">4aef2781</a> - docker ssh connection times can be slow when UseDNS is enabled</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="account-notice-meta clearfix">
									<div class="account-notice-meta-title pull-left">
										<a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> 接受了 <a href="#">#43</a> 合并请求，来自 <a href="#">李翌文 / Operation.PHP</a>
									</div>
									<div class="account-notice-meta-time pull-right">
										6分钟前
									</div>
								</div>
								<div class="account-notice-content">
									合并两种支付方式
								</div>
							</li>
							<li>
								<div class="account-notice-meta clearfix">
									<div class="account-notice-meta-title pull-left">
										<a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> 推送了 2 个提交到 <a href="3">feature/#43872</a>
									</div>
									<div class="account-notice-meta-time pull-right">
										6分钟前
									</div>
								</div>
								<div class="account-notice-content">
									<ul class="account-notice-content-list">
										<li><a href="#">4aef2781</a> - docker ssh connection times can be slow when UseDNS is enabled</li>
										<li><a href="#">4aef2781</a> - docker ssh connection times can be slow when UseDNS is enabled</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="account-notice-meta clearfix">
									<div class="account-notice-meta-title pull-left">
										<a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> 接受了 <a href="#">#43</a> 合并请求，来自 <a href="#">李翌文 / Operation.PHP</a>
									</div>
									<div class="account-notice-meta-time pull-right">
										6分钟前
									</div>
								</div>
								<div class="account-notice-content">
									合并两种支付方式
								</div>
							</li>
						</ul>
					</div>
					<div class="col-md-4">
						<div class="panel panel-default">
							<div class="panel-heading">项目列表</div>
							<div class="panel-body">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="按项目名查询">
                                    <span class="input-group-btn">
                                        <a class="btn btn-info" href="{%baseUrl('create')%}">新建项目</a>
                                    </span>
								</div>
							</div>
							<ul class="list-group">
								{%foreach $params['projects'] as $project%}
									<li class="list-group-item">
										<img src="/assets/img/gitlab-logo-square.png" class="img-circle" width="25" height="25">&nbsp;&nbsp;<a href="{%baseUrl($params['account']->identifier|cat:'/'|cat:$project->identifier)%}">{%$project->name%}</a>
									</li>
								{%/foreach%}
								{%foreach $params['otherProjects'] as $project%}
									<li class="list-group-item">
										<img src="/assets/img/gitlab-logo-square.png" class="img-circle" width="25" height="25">&nbsp;&nbsp;<a href="{%baseUrl($params['account']->identifier|cat:'/'|cat:$project->identifier)%}">{%$project->name%}</a>
									</li>
								{%/foreach%}
								<li class="list-group-item"><button class="btn btn-info btn-block" type="button">加载更多...</button></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>