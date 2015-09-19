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
					<div class="col-lg-12 table-responsive">
						<table class="table table-hover find-repo-table">
							<thead>
							<tr>
								<th>文件名</th>
								<th>提交 <i class="fa fa-angle-right"></i> <a href="#">{%$params['files']['current']['commit']['shorthash']%}</a><small> - {%$params['files']['current']['commit']['message']%}</small></th>
								<th>时间</th>
							</tr>
							</thead>
							<tbody>
							{%foreach $params['files']['children'] as $children%}
								<tr>
									<td class="find-tree-file">
										<a href="{%if $children['type'] == 'blob'%}{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/blob/{%$params['branch']%}/{%$children['path']%}{%elseif $children['type'] == 'folder'%}{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$params['branch']%}/{%$children['path']%}{%else%}{%/if%}"><span class="glyphicon {%if $children['type'] == 'folder'%}glyphicon-folder-close{%else%}glyphicon-file{%/if%}"></span> {%$children['name']%}</a>
									</td>
									<td class="find-tree-commit"><img class="img-circle" src="/assets/img/468149.png" width="16" height="16"> <a href="">{%$children['commit']['author']['name']%}</a> {%$children['commit']['message']%}</td>
									<td class="find-tree-updatetime">{%if !empty($children['commit']['time'])%}{%$children['commit']['time']->diffFromNowHumanReadable()%}{%/if%}</td>
								</tr>
							{%/foreach%}
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>