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
                            分支比较
                        </span>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<h3>比较分支、标签、提交</h3>
						<p>选择源分支或者是标签，以及目标分支或标签，点击“比较”按钮。</p>
						<p>将会显示从源版本到目标版本的不同之处。</p>
						<form class="form-inline">
							<div class="form-group">
								<a href="#" class="btn btn-info"><span class="glyphicon glyphicon-transfer"></span></a>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">源</div>
									<select id="sourceRef" class="selectpicker show-tick" data-style="btn-info" data-live-search="true" data-size="10">
										<optgroup label="Branch(es)">
											<option>master</option>
											<option>develop</option>
											<option>release/20150831</option>
											<option>feature/#43928</option>
										</optgroup>
										<optgroup label="Tag(s)">
											<option>v1.0.0</option>
											<option>v1.0.1</option>
											<option>v1.0.2</option>
										</optgroup>
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
										<optgroup label="Branch(es)">
											<option>master</option>
											<option>develop</option>
											<option>release/20150831</option>
											<option>feature/#43928</option>
										</optgroup>
										<optgroup label="Tag(s)">
											<option>v1.0.0</option>
											<option>v1.0.1</option>
											<option>v1.0.2</option>
										</optgroup>
									</select>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-info">比较</button>
								<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span> 创建合并请求</button>
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