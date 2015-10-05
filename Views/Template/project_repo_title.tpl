<ol class="breadcrumb pull-left">
	<li><a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$params['branch']%}">{%$params['project']->name%}</a></li>
{%if !empty($params['breadcrumb'])%}
{%for $i=0 to (count($params['breadcrumb']) - 1)%}
	{%if $i == (count($params['breadcrumb']) - 1)%}
	<li class="active">{%$params['breadcrumb'][$i]['name']%}</li>
	{%else%}
	<li><a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$params['branch']%}/{%$params['breadcrumb'][$i]['path']%}">{%$params['breadcrumb'][$i]['name']%}</a></li>
	{%/if%}
{%/for%}
{%/if%}
</ol>
<div class="pull-right">
{%if count($params['breadcrumb']) > 0%}
{%if count($params['breadcrumb']) == 1%}
	<a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$params['branch']%}"><span class="glyphicon glyphicon-plus"></span> 上一级</a>&nbsp;&nbsp;
{%else%}
	<a class="pjax" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/tree/{%$params['branch']%}/{%$params['breadcrumb'][count($params['breadcrumb'])-2]['path']%}"><span class="glyphicon glyphicon-plus"></span> 上一级</a>&nbsp;&nbsp;
{%/if%}
{%/if%}
	<a class="pjax" href="#"><span class="glyphicon glyphicon-plus"></span> 新增文件</a>
</div>