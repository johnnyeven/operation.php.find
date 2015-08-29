<div class="row find-project-name">
	<div class="col-md-12">
		<h4><a href="{%baseUrl($params['account']->identifier)%}">{%$params['account']->realname%}</a> / <a href="{%baseUrl($params['account']->identifier|cat:'/'|cat:$params['project']->identifier)%}">{%$params['project']->name%}</a></h4>
	</div>
</div>