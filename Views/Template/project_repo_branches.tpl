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
					<div class="col-sm-9">
						分支 <span class="badge">{%count($params['branches'])%}</span>&nbsp;&nbsp;
						<button class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 创建分支</button>
					</div>
					<div class="col-sm-3">
						<select id="selectSort" class="selectpicker show-tick" data-width="100%" data-style="btn-info">
							<option>名称排序</option>
							<option selected="selected">最后更新时间排序</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<ul class="find-branch-list">
						{%foreach $params['branches'] as $branch%}
							<li>
								<div class="find-branch-name">
									<h4>
										<a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$branch['name']%}" class="fin-branch-name-link">
											<strong><span class="glyphicon glyphicon-road"></span> {%$branch['name']%}</strong>
											{%if $branch['default'] == 1%}<span class="label label-primary">默认</span>{%/if%}
											{%if $branch['protected'] == 1%}<span class="label label-success"><span class="glyphicon glyphicon-lock"></span> 受保护</span>{%/if%}
											{%if $branch['merged'] == 1%}<span class="label label-warning"><span class="glyphicon glyphicon-ok"></span> 已合并</span>{%/if%}
										</a>
										<div class="pull-right">
											<a href="#" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-plus"></span> 创建合并请求</a>
											<a href="#" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-transfer"></span> 比较</a>
										</div>
									</h4>
								</div>
								<div class="find-branch-commit">
									<a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/commits/{%$branch['commit']['hash']%}">{%$branch['commit']['shorthash']%}</a>&nbsp;
									<span class="find-branch-commit-msg">{%$branch['commit']['message']%}</span>
									<span class="find-branch-commit-time pull-right">{%$branch['commit']['date']%}</span>
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