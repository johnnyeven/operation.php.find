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
				{%include file="project_repo_sub_sidebar.tpl"%}
			</div>
			<div class="col-md-8 find-main" id="find-main">
				<div class="row find-project-main-title">
					<div class="col-lg-12">
						<a href="#">Operation.php</a> / <a href="#">Controllers</a> / <a href="#">AccountController</a> /
						<a href="" class="pull-right"><span class="glyphicon glyphicon-plus"></span> 新增文件</a>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 table-responsive">
						<table class="table table-hover find-repo-table">
							<thead>
							<tr>
								<th>文件名</th>
								<th>提交 <i class="fa fa-angle-right"></i> <a href="#">{%$params['files']['current']['commit']['shorthash']%}</a><small> - {%$params['files']['current']['commit']['message']%}</small></th>
								<th>时间</th>
							</tr>
							</thead>
							<tbody>
							{%foreach $params['files']['children'] as $children%}
								<tr>
									<td class="find-tree-file"><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$params['branch']%}/{%$children['path']%}"><span class="glyphicon {%if $children['type'] == 'folder'%}glyphicon-folder-close{%else%}glyphicon-file{%/if%}"></span> {%$children['name']%}</a></td>
									<td class="find-tree-commit"><img class="img-circle" src="/assets/img/468149.png" width="16" height="16"> <a href="">{%$children['commit']['author']['name']%}</a> {%$children['commit']['message']%}</td>
									<td class="find-tree-updatetime">{%$children['commit']['time']%}</td>
								</tr>
							{%/foreach%}
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>