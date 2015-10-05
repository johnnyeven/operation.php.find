<div class="row find-project-name">
	<div class="col-md-12">
		<h4><a class="pjax" href="{%baseUrl($params['account']->identifier)%}">{%$params['account']->realname%}</a> / <a class="pjax" href="{%baseUrl($params['account']->identifier|cat:'/'|cat:$params['project']->identifier)%}">{%$params['project']->name%}</a></h4>
	</div>
</div>