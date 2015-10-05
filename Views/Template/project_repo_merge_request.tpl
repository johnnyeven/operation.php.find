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
						<span class="find-project-merge-title">合并请求</span> <span class="badge">1</span>
						<form class="form-inline pull-right">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="按标题搜索">
							</div>
							<div class="form-group">
								<a href="#" class="btn btn-info">搜索</a>
							</div>
							<div class="form-group">
								<a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/merge_request/compare" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 创建合并请求</a>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="find-merge-condition">
							<ul class="nav nav-tabs">
								<li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-info-sign"></span> 未处理</a></li>
								<li role="presentation"><a href="#"><span class="glyphicon glyphicon-ok-sign"></span> 已合并</a></li>
								<li role="presentation"><a href="#"><span class="glyphicon glyphicon-remove-sign"></span> 已驳回</a></li>
								<li role="presentation"><a href="#"><span class="glyphicon glyphicon-screenshot"></span> 全部</a></li>
							</ul>
							<div class="find-merge-condition-form">
								<form class="form-inline">
									<div class="form-group">
										<select id="selectConditionAssigned" class="selectpicker show-tick" data-style="btn-info" data-live-search="true" data-width="200px" data-size="10">
											<option>按照指派人员</option>
											<option>liyiwen</option>
											<option>lixu</option>
											<option>lijun</option>
											<option>wangyu</option>
										</select>
									</div>
									<div class="form-group">
										<select id="selectConditionAuthor" class="selectpicker show-tick" data-style="btn-info" data-live-search="true" data-width="200px" data-size="10">
											<option>按照作者</option>
											<option>liyiwen</option>
											<option>lixu</option>
											<option>lijun</option>
											<option>wangyu</option>
										</select>
									</div>
									<div class="form-group">
										<select id="selectConditionTag" class="selectpicker show-tick" data-style="btn-info" data-live-search="true" data-width="200px" data-size="10">
											<option>按照标签</option>
											<option>v1.0.0</option>
											<option>v1.0.1</option>
											<option>v1.0.2</option>
											<option>v1.0.3</option>
										</select>
									</div>
								</form>
							</div>
						</div>
						<div class="find-merge-condition-content">
							<ul class="list-group">
							{%foreach $params['result'] as $row%}
								<li class="list-group-item">
								<div class="find-commit-message">
									<a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/merge_request/detail/{%$row->id%}"><strong>{%$row->title%}</strong></a>
									<span class="pull-right">
										<span class="glyphicon glyphicon-road"></span> {%$row->target_branch%}
										&nbsp;
										<img src="/assets/img/468149.png" class="img-circle" width="16" height="16">
										&nbsp;
										{%if $row->comment_count > 0%}
										<a href="#"><span class="glyphicon glyphicon-comment"></span> {%$row->comment_count%}</a>
										{%else%}
										<span class="glyphicon glyphicon-comment"></span> 0
										{%/if%}
									</span>
								</div>
								<div class="find-commit-user">
									由johnnyeven在2分钟前打开
									<span class="pull-right find-commit-browse">创建于 {%date('Y-m-d H:i:s', $row->createtime)%}</span>
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
</div>

</body>
</html>