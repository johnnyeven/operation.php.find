<ul class="nav nav-pills nav-stacked">
				<li role="presentation"{%if $params['pageName'] == 'project_index'%} class="active"{%/if%}><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}"><span class="glyphicon glyphicon-home"></span> 主页</a></li>
				<li role="presentation"{%if $params['pageName'] == 'project_notice'%} class="active"{%/if%}><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/notice"><span class="glyphicon glyphicon-time"></span> 活动</a></li>
				<li role="presentation"{%if $params['pageName'] == 'project_wiki'%} class="active"{%/if%}><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/wiki"><span class="glyphicon glyphicon-th-list"></span> Wiki</a></li>
				<li class="nav-divider"></li>
				<li role="presentation"{%if $params['pageName'] == 'project_requirement'%} class="active"{%/if%}><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/requirement"><span class="glyphicon glyphicon-list-alt"></span> 需求 <span class="badge">12</span></a></li>
				<li role="presentation"{%if $params['pageName'] == 'project_module'%} class="active"{%/if%}><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/module"><span class="glyphicon glyphicon-th-large"></span> 模块 <span class="badge">2</span></a></li>
				<li role="presentation"{%if $params['pageName'] == 'project_task'%} class="active"{%/if%}><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/task"><span class="glyphicon glyphicon-check"></span> 任务 <span class="badge">4</span></a></li>
				<li role="presentation"{%if $params['pageName'] == 'project_bug'%} class="active"{%/if%}><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/bug"><span class="glyphicon glyphicon-question-sign"></span> 问题 <span class="badge">284</span></a></li>
				<li class="nav-divider"></li>
				<li role="presentation"{%if $params['pageName'] == 'project_release'%} class="active"{%/if%}><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/release"><span class="glyphicon glyphicon-gift"></span> 发布</a></li>
				<li role="presentation"{%if $params['pageName'] == 'project_document'%} class="active"{%/if%}><a href="{%baseUrl($params['userName'])%}/{%$params['projectName']%}/document"><span class="glyphicon glyphicon-file"></span> 文档</a></li>
</ul>