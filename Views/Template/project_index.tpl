<!DOCTYPE html>
<html lang="en">

{%include file="std_head.tpl"%}

<body id="find-body" style="display: none;">

<div class="container-fluid">
	{%include file="std_nav.tpl"%}
	<div class="container-fluid find-container">
		<div id="workarea" class="row">
			<div class="col-md-2 find-sidebar" id="find-sidebar">
				{%include file="project_sidebar.tpl"%}
			</div>
			<div class="col-md-10 find-main" id="find-main">
				{%include file="project_title.tpl"%}
				<div class="row text-center">
					<div class="col-md-12">
						<img class="img-circle" src="{%if empty($params['project']->avatar_path)%}/assets/img/find-icon.png{%else%}{%$params['project']->avatar_path%}{%/if%}" width="100" height="100">
						<h1>{%$params['project']->name%}</h1>
						<h1><small>{%$params['project']->description%}</small></h1>
						<div class="find-project-index-button">
							<a href="#" class="btn btn-info"><i class="glyphicon glyphicon-heart"></i> 喜欢</a>
							<a href="#" class="btn btn-info"><i class="glyphicon glyphicon-download-alt"></i> 下载</a>
						</div>
						<div class="find-project-index-ssh">
							<div class="input-group">
                                <span class="input-group-btn" data-toggle="buttons">
                                    <label class="btn btn-default active"><input type="radio" name="cloneMethod" id="cloneMethodSsh" autocomplete="off" checked="checked">SSH</label>
                                    <label class="btn btn-default"><input type="radio" name="cloneMethod" id="cloneMethodHttps" autocomplete="off">HTTPS</label>
                                </span>
								<input type="text" class="form-control" value="git@find.profzone.net:johnnyeven/operation.git">
								<span class="input-group-addon" id="basic-addon2"><i class="glyphicon glyphicon-globe"></i> 公开</span>
							</div>
						</div>
						<div class="find-project-index-meta">
							<a href="#" class="btn">0 Commits</a>
							<a href="#" class="btn">0 Branches</a>
							<a href="#" class="btn">0 Tags</a>
						</div>
					</div>
				</div>
				<div class="row find-project-readme markdown-content">
					<div class="col-md-12">
						{%$params['readme']%}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>