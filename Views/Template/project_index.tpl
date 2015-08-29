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
<script src="/assets/js/require.js" data-main="/assets/js/find.project-index.js"></script>
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
			<div class="col-md-10 find-main" id="find-main">
				{%include file="project_title.tpl"%}
				<div class="row text-center">
					<div class="col-md-12">
						<img class="img-circle" src="/assets/img/gitlab-logo-square.png" width="100" height="100">
						<h1>Operation.PHP Framework</h1>
						<h1><small>一个轻量级的、高效的、敏捷的MVC框架，采用PHP编写</small></h1>
						<div class="find-project-index-button">
							<a href="#" class="btn btn-info"><i class="glyphicon glyphicon-heart"></i> 喜欢</a>
							<a href="#" class="btn btn-info"><i class="glyphicon glyphicon-download-alt"></i> 下载</a>
						</div>
						<div class="find-project-index-ssh">
							<div class="input-group">
                                <span class="input-group-btn" data-toggle="buttons">
                                    <label class="btn btn-default active"><input type="radio" name="cloneMethod" id="cloneMethodSsh" autocomplete="off" checked="checked">SSH</label>
                                    <label class="btn btn-default"><input type="radio" name="cloneMethod" id="cloneMethodHttps" autocomplete="off">HTTPS</label>
                                </span>
								<input type="text" class="form-control" value="git@find.profzone.net:johnnyeven/operation.git">
								<span class="input-group-addon" id="basic-addon2"><i class="glyphicon glyphicon-globe"></i> 公开</span>
							</div>
						</div>
						<div class="find-project-index-meta">
							<a href="#" class="btn">0 Commits</a>
							<a href="#" class="btn">0 Branches</a>
							<a href="#" class="btn">0 Tags</a>
						</div>
					</div>
				</div>
				<div class="row find-project-readme markdown-content">
					<div class="col-md-12">
						{%$params['readme']%}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>