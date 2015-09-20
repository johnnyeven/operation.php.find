<div class="row find-project-sub-title">
	<div class="col-md-5">
		<i class="glyphicon glyphicon-hdd"></i>
	</div>
	<div class="col-md-5 pull-right text-right">
		<span class="">版本库</span>
	</div>
</div>
<h4>分支</h4>
<div class="dropdown">
	<select id="selectBranch" class="selectpicker show-tick" data-live-search="true" data-width="100%" data-size="10">
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
<h4>打包</h4>
<div class="btn-group">
	<button type="button" class="btn btn-default">下载 zip</button>
	<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<span class="caret"></span>
		<span class="sr-only">Toggle Dropdown</span>
	</button>
	<ul class="dropdown-menu">
		<li><a href="#"><span class="glyphicon glyphicon-download-alt"></span> 下载 zip</a></li>
		<li><a href="#"><span class="glyphicon glyphicon-download-alt"></span> 下载 tar.gz</a></li>
		<li><a href="#"><span class="glyphicon glyphicon-download-alt"></span> 下载 tar.bz2</a></li>
		<li><a href="#"><span class="glyphicon glyphicon-download-alt"></span> 下载 tar</a></li>
	</ul>
</div>
<hr>
<h4>项目内搜索</h4>
<form role="search">
	<div class="form-group">
		<input type="text" class="form-control" placeholder="搜索">
	</div>
</form>
<hr>
<ul class="nav nav-pills nav-stacked">
	<li role="presentation"{%if in_array($params['pageName'], ['project_repo_tree','project_repo_blob'])%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%getDefaultBranch()%}"><span class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;文件</a></li>
	<li role="presentation"{%if in_array($params['pageName'], ['project_repo_commits', 'project_repo_commit'])%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/commits/{%getDefaultBranch()%}"><span class="glyphicon glyphicon-repeat"></span>&nbsp;&nbsp;提交</a></li>
	<li role="presentation"{%if $params['pageName'] == 'project_repo_branches'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/branches"><span class="glyphicon glyphicon-road"></span>&nbsp;&nbsp;分支</a></li>
	<li role="presentation"{%if $params['pageName'] == 'project_repo_tags'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tags"><span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;标签</a></li>
	<li role="presentation"{%if $params['pageName'] == 'project_repo_compare'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/compare"><span class="glyphicon glyphicon-transfer"></span>&nbsp;&nbsp;分支比较</a></li>
	<li role="presentation"><a href="#"><span class="glyphicon glyphicon-tasks"></span>&nbsp;&nbsp;合并请求</a></li>
	<li role="presentation"><a href="#"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;设置</a></li>
</ul>