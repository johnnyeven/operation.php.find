<div class="find-project-title">
	<a href="#">
		Operation.PHP <span class="glyphicon glyphicon-chevron-down"></span>
	</a>
</div>
<h6><small>基本信息</small></h6>
<ul class="nav nav-pills nav-stacked">
	<li role="presentation"{%if $params['pageName'] == 'project_index'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
	<li role="presentation"{%if $params['pageName'] == 'project_notice'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/notice"><i class="glyphicon glyphicon-time"></i> 活动<span class="badge pull-right">12</span></a></li>
	<li role="presentation"{%if in_array($params['pageName'], ['project_repo_tree'])%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%getDefaultBranch()%}"><i class="glyphicon glyphicon-hdd"></i> 版本库</a></li>
	<li role="presentation"{%if $params['pageName'] == 'project_wiki'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/wiki"><i class="glyphicon glyphicon-th-list"></i> Wiki<span class="badge pull-right">12</span></a></li>
	<li class="nav-divider"></li>
</ul>
<h6><small>项目管理</small></h6>
<ul class="nav nav-pills nav-stacked">
	<li role="presentation"{%if $params['pageName'] == 'project_requirement'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/requirement"><span class="glyphicon glyphicon-list-alt"></span> 需求 <span class="badge pull-right">12</span></a></li>
	<li role="presentation"{%if $params['pageName'] == 'project_module'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/module"><span class="glyphicon glyphicon-th-large"></span> 模块 <span class="badge pull-right">2</span></a></li>
	<li role="presentation"{%if $params['pageName'] == 'project_task'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/task"><span class="glyphicon glyphicon-check"></span> 任务 <span class="badge pull-right">4</span></a></li>
	<li role="presentation"{%if $params['pageName'] == 'project_bug'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/bug"><span class="glyphicon glyphicon-question-sign"></span> 问题 <span class="badge pull-right">284</span></a></li>
	<li class="nav-divider"></li>
</ul>
<h6><small>支持</small></h6>
<ul class="nav nav-pills nav-stacked">
	<li role="presentation"{%if $params['pageName'] == 'project_release'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/release"><span class="glyphicon glyphicon-gift"></span> 发布</a></li>
	<li role="presentation"{%if $params['pageName'] == 'project_document'%} class="active"{%/if%}><a href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/document"><span class="glyphicon glyphicon-file"></span> 文档</a></li>
</ul>