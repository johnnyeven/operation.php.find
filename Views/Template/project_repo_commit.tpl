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
                            提交 #{%$params['commit']->getShortHash()%}
                        </span>
                        <span class="find-project-merge-detail-title">
                            <small>由 <a href="#"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> {%$params['author']->getName()%}</a> 在 {%$params['date']->diffFromNowHumanReadable()%} 创建</small>
                        </span>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 find-project-merge-detail">
						<div class="find-project-merge-desc">
							<h3>{%$params['commit']->getMessage()%}</h3>
						</div>
						<hr>
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