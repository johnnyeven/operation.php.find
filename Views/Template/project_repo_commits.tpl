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
			<div class="col-md-8 find-main find-project-commit" id="find-main">
				<div class="row find-project-main-title">
					<div class="col-lg-12">
						提交 <span class="badge">1,844</span>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 find-commit" id="find-commit-container">
					{%foreach $params['commits'] as $date => $commits%}
						<div class="row find-commit-row">
							<div class="col-lg-2">
								<h5><span class="glyphicon glyphicon-calendar"></span> {%$date%}</h5>
								<p class="find-commit-count"><small>{%count($commits)%} commit{%if count($commits)>1%}s{%/if%}</small></p>
							</div>
							<div class="col-lg-10">
								<ul class="find-borderd-list">
								{%for $i = 0 to (count($commits) - 1)%}
									<li>
										<div class="find-commit-message">
											<strong><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/commit/{%$commits[$i]['hash']%}">{%$commits[$i]['message']%}</a></strong>
											<span class="pull-right"><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/commit/{%$commits[$i]['hash']%}">{%$commits[$i]['shorthash']%}</a></span>
										</div>
										<div class="find-commit-user">
											<img src="/assets/img/468149.png" class="img-circle" width="32" height="32">
											<a href="#">{%$commits[$i]['author']['name']%}</a> 上传于 {%$commits[$i]['time']->diffFromNowHumanReadable()%}
											<span class="pull-right find-commit-browse"><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$commits[$i]['hash']%}">浏览代码 <span class="glyphicon glyphicon-chevron-right"></span></a></span>
										</div>
									</li>
								{%/for%}
								</ul>
							</div>
						</div>
						<hr>
					{%/foreach%}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>