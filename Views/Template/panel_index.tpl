<!DOCTYPE html>
<html lang="en">

{%include file="std_head.tpl"%}

<body id="find-body" style="display: none;">

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
						{%foreach $params['notices'] as $notice%}
							<li>{%$notice->format()%}</li>
						{%/foreach%}
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
										<img src="/assets/img/gitlab-logo-square.png" class="img-circle" width="25" height="25">&nbsp;&nbsp;<a href="{%baseUrl($project->account_identifier|cat:'/'|cat:$project->identifier)%}">{%$project->account_realname|cat:' / '|cat:$project->name%}</a>
									</li>
								{%/foreach%}
								{%foreach $params['otherProjects'] as $project%}
									<li class="list-group-item">
										<img src="/assets/img/gitlab-logo-square.png" class="img-circle" width="25" height="25">&nbsp;&nbsp;<a href="{%baseUrl($project->account_identifier|cat:'/'|cat:$project->identifier)%}">{%$project->account_realname|cat:' / '|cat:$project->name%}</a>
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