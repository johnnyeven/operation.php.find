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
						<h3>合并请求分支比较</h3>
						<form action="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/merge_request/add" method="get">
							<div class="row">
								<div class="col-lg-6">
									<div class="panel panel-default">
										<div class="panel-heading">源分支</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-lg-6">
													<select id="sltSourceRepo" name="sltSourceRepo" class="selectpicker show-tick" data-live-search="true" data-width="100%" data-size="10">
														<option value="4321">johnnyeven / operation</option>
													</select>
												</div>
												<div class="col-lg-6">
													<select id="sltSourceBranch" name="sltSourceBranch" class="selectpicker show-tick" data-live-search="true" data-width="100%" data-size="10">
														{%include file="select_branch_and_tags.tpl"%}
													</select>
												</div>
											</div>
										</div>
										<div class="panel-footer"></div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="panel panel-default">
										<div class="panel-heading">目标分支</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-lg-6">
													<select id="sltTargetRepo" name="sltTargetRepo" class="selectpicker show-tick" data-live-search="true" data-width="100%" data-size="10">
														<option value="4321">johnnyeven / operation</option>
													</select>
												</div>
												<div class="col-lg-6">
													<select id="sltTargetBranch" name="sltTargetBranch" class="selectpicker show-tick" data-live-search="true" data-width="100%" data-size="10">
														{%include file="select_branch_and_tags_target.tpl"%}
													</select>
												</div>
											</div>
										</div>
										<div class="panel-footer"></div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<button type="submit" class="btn btn-info">创建合并请求</button>
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