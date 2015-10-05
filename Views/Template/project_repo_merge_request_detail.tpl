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
							{%if $params['result']->status == 'open'%}
								{%$class = 'label-warning'%}
								{%$status = '未合并'%}
							{%elseif $params['result']->status == 'merged'%}
								{%$class = 'label-success'%}
								{%$status = '已合并'%}
							{%elseif $params['result']->status == 'closed'%}
								{%$class = 'label-danger'%}
								{%$status = '已关闭'%}
							{%/if%}
                            <span class="label {%$class%}">{%$status%}</span> 合并请求 #{%$params['result']->id%}
                        </span>
                        <span class="find-project-merge-detail-title">
                            <small>由 <a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> 在 {%$params['result']->createtime->diffFromNowHumanReadable()%} 创建</small>
                            &nbsp;&nbsp;
                            <small><span class="glyphicon glyphicon-edit"></span> 在 {%$params['result']->updatetime->diffFromNowHumanReadable()%} 更新</small>
                        </span>
						<div class="find-project-merge-control pull-right">
							<button class="btn btn-info"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 find-project-merge-detail">
						<h3>{%$params['result']->title%}</h3>
						<div class="find-project-merge-desc">
							{%$params['result']->description%}
						</div>
						<hr>
						<p>请求将 <strong>{%$params['result']->source_branch%}</strong> 合并至 <strong>{%$params['result']->target_branch%}</strong></p>
						<div class="well">
							<div class="merge-control clearfix">
								<div class="merge-control-item">
									<button class="btn btn-info"><span class="glyphicon glyphicon-ok"></span> 接受合并请求</button>
									<button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> 驳回并关闭</button>
								</div>
								<div class="merge-control-item">
									<label>
										<input type="checkbox"> 删除源分支
									</label>
								</div>
								<div class="merge-control-item">
									<a href="#"><span class="glyphicon glyphicon-edit"></span> 编辑提交信息</a>
								</div>
							</div>
							<div class="merge-control merge-control-comment">
								<div class="modal fade" id="mergeControlComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="myModalLabel">如何手动合并</h4>
											</div>
											<div class="modal-body">
												<p>
													<strong>Step 1.</strong>
													Update the repo and checkout the branch we are going to merge
												</p>
                                                <pre class="dark">git fetch origin
git checkout -b develop origin/develop</pre>
												<p>
													<strong>Step 2.</strong>
													Merge the branch and push the changes to GitLab
												</p>
                                                <pre class="dark">git checkout master
git merge --no-ff develop
git push origin master</pre>
											</div>
										</div>
									</div>
								</div>
								如果你想在本地手动合并代码，可以使用<a href="#" data-toggle="modal" data-target="#mergeControlComment">命令行</a>
							</div>
						</div>
						<div class="alert alert-success" role="alert">
							<h4>已由 <a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> 在3分钟前执行合并操作</h4>
							<p>修改已合并至 <strong>develop</strong> 分支，源分支已删除</p>
						</div>
						<div class="alert alert-danger" role="alert">
							<h4>已由 <a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> 在3分钟前关闭</h4>
							<p>修改没有合并至 <strong>develop</strong> 分支</p>
						</div>
						<ul class="nav nav-tabs nav-justified" role="tablist">
							<li role="presentation" class="active"><a href="#mergeComment" aria-controls="home" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-comment"></span> 讨论 <span class="badge">1</span></a></li>
							<li role="presentation"><a href="#mergeCommit" aria-controls="profile" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-refresh"></span> 提交 <span class="badge">1</span></a></li>
							<li role="presentation"><a href="#mergeChange" aria-controls="messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-edit"></span> 修改 <span class="badge">1</span></a></li>
						</ul>
						<div class="tab-content find-project-merge-tab">
							<div role="tabpanel" class="tab-pane active" id="mergeComment">
								<div class="row">
									<div class="col-sm-9">
										<ul class="find-commit-timeline">
											<li class="find-commit-timeline-entry system">
												<div class="find-commit-timeline-entry-inner">
													<div class="timeline-icon"></div>
													<div class="timeline-content">
														<div class="timeline-content-header">
															<a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> - <span class="timeline-content-header-time">2分钟前</span>
														</div>
														<div class="timeline-content-content">
															<p>推送了 2 个提交</p>
															<ul class="timeline-content-list">
																<li><a href="#">4aef2781</a> - docker ssh connection times can be slow when UseDNS is enabled</li>
																<li><a href="#">4aef2781</a> - docker ssh connection times can be slow when UseDNS is enabled</li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li class="find-commit-timeline-entry system">
												<div class="find-commit-timeline-entry-inner">
													<div class="timeline-icon"></div>
													<div class="timeline-content">
														<div class="timeline-content-header">
															<a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a> - <span class="timeline-content-header-time">2分钟前</span>
														</div>
														<div class="timeline-content-content">
															<p>分配给 <a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> 李翌文</a></p>
														</div>
													</div>
												</div>
											</li>
											<li class="find-commit-timeline-entry">
												<div class="find-commit-timeline-entry-inner">
													<div class="timeline-icon">
														<a href="#"><img src="/assets/img/468149.png" class="img-circle" width="40" height="40"></a>
													</div>
													<div class="timeline-content">
														<div class="timeline-content-header">
															<a href="#">李翌文</a> - <span class="timeline-content-header-time">2分钟前</span>
														</div>
														<div class="timeline-content-content">
															<p>Do you have problems with DNS from Docker containers? Can you add the CHANGELOG entry?</p>
														</div>
													</div>
												</div>
											</li>
										</ul>
										<div class="find-commit-write">
											<div class="find-commit-write-avatar pull-left">
												<img src="/assets/img/468149.png" class="img-circle" width="40" height="40">
											</div>
											<form>
												<textarea id="iptComment" name="content" rows="8"></textarea>
											</form>
										</div>
									</div>
									<div class="col-sm-3">
										<h5>李翌文/Operation.PHP/#35</h5>
										<hr>
										<form>
											<div class="form-group">
												<label for="selectAssignee">指派给 <a href="#"><img src="/assets/img/468149.png" class="img-circle" width="20" height="20"> 李翌文</a></label>
												<select id="selectAssignee" class="selectpicker show-tick" data-live-search="true" data-width="100%" data-size="5" data-header="选择审核人员">
													<option data-content="<img src='/assets/img/468149.png' class='img-circle pull-left' width='25' height='25'><div class='merge-assignee'><h4>李翌文</h4><h5><small>johnnyeven</small></h5></div>">李翌文</option>
													<option data-content="<img src='/assets/img/468149.png' class='img-circle pull-left' width='25' height='25'><div class='merge-assignee'><h4>李翌文</h4><h5><small>johnnyeven</small></h5></div>">李翌文</option>
													<option data-content="<img src='/assets/img/468149.png' class='img-circle pull-left' width='25' height='25'><div class='merge-assignee'><h4>李翌文</h4><h5><small>johnnyeven</small></h5></div>">李翌文</option>
													<option data-content="<img src='/assets/img/468149.png' class='img-circle pull-left' width='25' height='25'><div class='merge-assignee'><h4>李翌文</h4><h5><small>johnnyeven</small></h5></div>">李翌文</option>
													<option data-content="<img src='/assets/img/468149.png' class='img-circle pull-left' width='25' height='25'><div class='merge-assignee'><h4>李翌文</h4><h5><small>johnnyeven</small></h5></div>">李翌文</option>
												</select>
											</div>
											<div class="form-group">
												<label for="selectMilestone">里程碑</label>
												<select id="selectMilestone" class="selectpicker show-tick" data-live-search="true" data-width="100%" data-size="10" data-header="选择里程碑">
												</select>
											</div>
											<div class="form-group">
												<label for="btnSubscribe">订阅</label>
												<button id="btnSubscribe" class="btn btn-default btn-block"><span class="glyphicon glyphicon-eye-open"></span> 订阅</button>
											</div>
											<div class="well well-sm">
												你目前<code>不会</code>收到来自这个主题的通知
											</div>
										</form>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane" id="mergeCommit">
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>