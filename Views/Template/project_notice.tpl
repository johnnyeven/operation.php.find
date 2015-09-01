<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>发现 - 李翌文</title>
	<link rel="shortcut icon" href="/assets/img/gt_favicon.png">
	<script src="/assets/js/require.js" data-main="/assets/js/find.start.js"></script>
	<!--[if lt IE 9]> <script src="/assets/js/html5shiv.js"></script> <![endif]-->
</head>

<body>

<div class="container-fluid">
	{%include file="std_nav.tpl"%}
	<div class="container-fluid find-container">
		<div id="workarea" class="row">
			<div class="col-md-2 find-sidebar" id="find-sidebar">
				{%include file="project_sidebar.tpl"%}
			</div>
			<div class="col-md-2 find-sub-sidebar" id="find-sub-sidebar">
				{%include file="project_notice_sub_sidebar.tpl"%}
			</div>
			<div class="col-md-8 find-main" id="find-main">
				<div class="row find-project-main-title text-center">

				</div>
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
				{%foreach $params['notices'] as $notice%}
					<li>{%$notice->format()%}</li>
				{%/foreach%}
				</ul>
			</div>
		</div>
	</div>
</div>

</body>
</html>