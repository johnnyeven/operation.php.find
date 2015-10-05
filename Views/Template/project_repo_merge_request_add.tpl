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
                        <span class="find-project-merge-title">
                            合并请求
                        </span>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<h3>创建合并请求</h3>
						<h5>从 <code>operation:release/v1.0.0</code> 合并到 <code>operation:master</code></h5>
						<hr>
						<form class="form-horizontal" action="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/merge_request/add" method="post">
							<input type="hidden" name="sourceRepo" value="{%$params['sourceRepo']%}">
							<input type="hidden" name="targetRepo" value="{%$params['targetRepo']%}">
							<div class="form-group">
								<label for="iptTitle" class="col-sm-2 control-label">标题(*)</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="iptTitle" name="iptTitle" placeholder="标题" value="{%$params['message']%}">
								</div>
							</div>
							<div class="form-group">
								<label for="iptComment" class="col-sm-2 control-label">描述</label>
								<div class="col-sm-10">
									<textarea id="iptComment" name="iptComment" rows="8"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="sltAssignee" class="col-sm-2 control-label"><i class="fa fa-user"></i> 指派给</label>
								<div class="col-sm-10">
									<select id="sltAssignee" name="sltAssignee" class="selectpicker show-tick bs-select-hidden" data-live-search="true" data-width="200px" data-size="5" data-header="选择审核人员">
										<option value="">- 无 -</option>
										<option data-content="<img src='/assets/img/468149.png' class='img-circle pull-left' width='25' height='25'><div class='merge-assignee'><h4>李翌文</h4><h5><small>johnnyeven</small></h5></div>">李翌文</option>
										<option data-content="<img src='/assets/img/468149.png' class='img-circle pull-left' width='25' height='25'><div class='merge-assignee'><h4>李翌文</h4><h5><small>johnnyeven</small></h5></div>">李翌文</option>
									</select>
									<a href="#" class="btn btn-default">指派给Leader</a>
								</div>
							</div>
							<div class="form-group">
								<label for="sltRelease" class="col-sm-2 control-label"><span class="glyphicon glyphicon-gift"></span> 发布</label>
								<div class="col-sm-10">
									<select id="sltRelease" name="sltRelease" class="selectpicker show-tick bs-select-hidden" data-live-search="true" data-width="200px" data-size="5" data-header="选择针对哪一个发布">

									</select>
									<a href="#" class="btn btn-link"><span class="glyphicon glyphicon-plus"></span> 创建一个新发布</a>
								</div>
							</div>
							<div class="form-group">
								<label for="sltTag" class="col-sm-2 control-label"><span class="glyphicon glyphicon-tag"></span> 标签</label>
								<div class="col-sm-10">
									<select multiple id="sltTag" name="sltTag" class="selectpicker show-tick bs-select-hidden" data-live-search="true" data-width="200px" data-size="5" data-header="选择针对哪一个发布">
										<option>bug</option>
										<option>需求</option>
										<option>性能</option>
										<option>已确认</option>
										<option>紧急</option>
									</select>
									<a href="#" class="btn btn-link"><span class="glyphicon glyphicon-plus"></span> 创建一个新标签</a>
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="sltSourceBranch" class="col-sm-2 control-label"><i class="fa fa-code-fork"></i> 源分支</label>
								<div class="col-sm-10">
									<select id="sltSourceBranch" name="sltSourceBranch" class="selectpicker show-tick bs-select-hidden" data-width="200px" data-style="disabled">
										<option value="{%$params['sourceBranch']%}">{%$params['sourceBranch']%}</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="sltSourceBranch" class="col-sm-2 control-label"><i class="fa fa-code-fork"></i> 目标分支</label>
								<div class="col-sm-10">
									<select id="sltTargetBranch" name="sltTargetBranch" class="selectpicker show-tick bs-select-hidden" data-width="200px" data-style="disabled">
										<option value="{%$params['targetBranch']%}">{%$params['targetBranch']%}</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"></label>
								<div class="col-sm-10">
									<a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/merge_request/compare" class="btn btn-link pjax">比较分支</a>
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label class="col-sm-2 control-label"></label>
								<div class="col-sm-10">
									<button class="btn btn-info btn-lg" type="submit">创建合并请求</button>
								</div>
							</div>
							<hr>
							<ul class="nav nav-tabs nav-justified" role="tablist">
								<li class="active" role="presentation"><a href="#mergeCommit" aria-controls="profile" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-refresh"></span> 提交 <span class="badge">1</span></a></li>
								<li role="presentation"><a href="#mergeChange" aria-controls="messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-edit"></span> 修改 <span class="badge">1</span></a></li>
							</ul>
							<div class="tab-content find-project-merge-tab">
								<div role="tabpanel" class="tab-pane active" id="mergeCommit">
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
															<strong><a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/commit/{%$commits[$i]['hash']%}">{%$commits[$i]['message']%}</a></strong>
															<span class="pull-right"><a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/commit/{%$commits[$i]['hash']%}">{%$commits[$i]['shorthash']%}</a></span>
														</div>
														<div class="find-commit-user">
															<img src="/assets/img/468149.png" class="img-circle" width="32" height="32">
															<a class="pjax" href="#">{%$commits[$i]['author']['name']%}</a> 上传于 {%$commits[$i]['time']->diffFromNowHumanReadable()%}
															<span class="pull-right find-commit-browse"><a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$commits[$i]['hash']%}">浏览代码 <span class="glyphicon glyphicon-chevron-right"></span></a></span>
														</div>
													</li>
												{%/for%}
											</ul>
										</div>
									</div>
									<hr>
								{%/foreach%}
								</div>
								<div role="tabpanel" class="tab-pane" id="mergeChange">
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
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>