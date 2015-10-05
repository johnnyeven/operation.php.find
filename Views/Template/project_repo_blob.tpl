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
					<div class="col-lg-12">
						{%include file='project_repo_title.tpl'%}
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-12">
								<div class="well well-sm">
									<div class="find-commit-message">
										<strong><a class="pjax" href="#">{%$params['file']['commit']['message']%}</a></strong>
										<span class="pull-right"><a class="pjax" href="#">{%$params['file']['commit']['shorthash']%}</a></span>
									</div>
									<div class="find-commit-user">
										<img src="/assets/img/468149.png" class="img-circle" width="32" height="32">
										<a class="pjax" href="#">{%$params['file']['commit']['author']['name']%}</a> 上传于 {%$params['file']['commit']['time']->diffFromNowHumanReadable()%}
										<span class="pull-right find-commit-browse"><a class="pjax" href="#">浏览代码 <span class="glyphicon glyphicon-chevron-right"></span></a></span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading clearfix find-file-editor-header">
										<div class="pull-left">
											<span class="glyphicon glyphicon-file"></span> {%$params['file']['name']%} - {%fileSizeHumanReadable($params['file']['size'])%}
										</div>
										<div class="btn-group pull-right" data-toggle="buttons">
											<label class="btn btn-default">
												<input type="radio" name="optDisplayType" id="optDisplayType1" autocomplete="off"> Raw
											</label>
											<label class="btn btn-default">
												<input type="radio" name="optDisplayType" id="optDisplayType2" autocomplete="off"> Blame
											</label>
											<label class="btn btn-default">
												<input type="radio" name="optDisplayType" id="optDisplayType3" autocomplete="off"> History
											</label>
											<label class="btn btn-default">
												<input type="radio" name="optDisplayType" id="optDisplayType4" autocomplete="off"> Permalink
											</label>
										</div>
									</div>
									<div class="panel-body{%if $params['file']['type'] != 'markdown'%} panel-nopadding{%/if%}">
										<span id="file-type" class="hidden">{%$params['file']['type']%}</span>
										<div id="file-content" class="find-file-editor">{%$params['file']['content']%}</div>
									</div>
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