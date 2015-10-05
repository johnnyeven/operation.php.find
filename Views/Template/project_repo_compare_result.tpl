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
				<div class="row find-project-main-title find-project-main-compare-title">
					<div class="col-lg-12">
						<form class="form-inline clearfix" id="compare" action="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/compare/">
							<div class="form-group">
								<button type="button" id="btnCompareExchange" class="btn btn-info"><span class="glyphicon glyphicon-transfer"></span></button>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">源</div>
									<select id="sourceRef" class="selectpicker show-tick" data-style="btn-info" data-live-search="true" data-size="10">
										{%include file="select_branch_and_tags.tpl"%}
									</select>
								</div>
							</div>
							<div class="form-group">
								&nbsp;
								<span class="glyphicon glyphicon-arrow-right"></span>
								&nbsp;
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">目标</div>
									<select id="targetRef" class="selectpicker show-tick" data-style="btn-info" data-live-search="true" data-size="10">
										{%include file="select_branch_and_tags_target.tpl"%}
									</select>
								</div>
							</div>
							<div class="form-group">
								<button id="btnCompare" type="button" class="btn btn-info">比较</button>
							</div>
							<div class="form-group">
								<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-plus"></span> 创建合并请求</button>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">提交<span class="badge">{%count($params['commits'])%}</span></h3>
							</div>
							<ul class="list-group">
							{%foreach $params['commits'] as $commit%}
								<li class="list-group-item">
								<div class="find-commit-message">
									<strong><a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/commit/{%$commit['hash']%}">{%$commit['message']%}</a></strong>
									<span class="pull-right"><a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/commit/{%$commit['hash']%}">{%$commit['shorthash']%}</a></span>
								</div>
								<div class="find-commit-user">
									<img src="/assets/img/468149.png" class="img-circle" width="32" height="32">
									<a class="pjax" href="#">{%$commit['author']['name']%}</a> 上传于 {%$commit['time']->diffFromNowHumanReadable()%}
									<span class="pull-right find-commit-browse"><a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$commit['hash']%}">浏览代码 <span class="glyphicon glyphicon-chevron-right"></span></a></span>
								</div>
							</li>
							{%/foreach%}
							</ul>
						</div>
						<div class="find-project-compare-files">
							<div class="files-meta clearfix">
								<div class="pull-left">显示 <a href="#">44个变动的文件</a></div>
								<div class="btn-group pull-right" role="group" id="optDisplayType">
									<button type="button" data-content="0" class="btn btn-primary{%if $params['view'] != 'parallel'%} active{%/if%}">内联</button>
									<button type="button" data-content="1" class="btn btn-primary{%if $params['view'] == 'parallel'%} active{%/if%}">独立</button>
								</div>
							</div>
							{%foreach $params['diff']->files as $key => $diffFile%}
								{%if $params['view'] == 'parallel'%}
									{%include file="diffs/text_parallel.tpl"%}
								{%else%}
									{%include file="diffs/text_inline.tpl"%}
								{%/if%}
							{%/foreach%}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>