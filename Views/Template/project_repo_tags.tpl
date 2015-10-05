<!DOCTYPE html>
<html lang="en">

{%include file="std_head.tpl"%}

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
					<div class="col-sm-12">
						标签 <span class="badge">{%count($params['tags'])%}</span>&nbsp;&nbsp;
						<button class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 创建标签</button>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<ul class="find-branch-list">
						{%foreach $params['tags'] as $tag%}
							<li>
								<div class="find-branch-name">
									<h4>
										<a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$tag['name']%}" class="fin-branch-name-link pjax">
											<strong><span class="glyphicon glyphicon-tag"></span> {%$tag['name']%}</strong>
										</a>
										<div class="pull-right">
											<a href="#" class="btn btn-default btn-xs pjax"><span class="glyphicon glyphicon-download-alt"></span> zip</a>
											<a href="#" class="btn btn-default btn-xs pjax"><span class="glyphicon glyphicon-download-alt"></span> tar.gz</a>
										</div>
									</h4>
								</div>
								<div class="find-branch-commit">
									<a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/commits/{%$tag['commit']['hash']%}">{%$tag['commit']['shorthash']%}</a>&nbsp;
									<span class="find-branch-commit-msg">{%$tag['commit']['message']%}</span>
									<span class="find-branch-commit-time pull-right">{%$tag['commit']['date']%}</span>
								</div>
							</li>
						{%/foreach%}
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>