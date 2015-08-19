<div class="row">
	<div class="col-md-1">
		<span class="glyphicon glyphicon-question-sign"></span>
	</div>
	<div class="col-md-11">
		<p><small>3 天前</small></p>
		<div class="row">
			<div class="col-md-1">
				<a href=""><img class="img-circle" src="assets/images/468149.png" width="40" height="40"></a>
			</div>
			<div class="col-md-11">
				<p><a href="#">#{%$params['notice']->workflow_number%}</a> {%$params['notice']->workflow_title%}</p>
				<p><a href="{%baseUrl($params['notice']->account_identifier)%}">{%$params['notice']->account_realname%}</a> 将 <a href="{%baseUrl($params['notice']->identifier|cat:'/'|cat:$params['notice']->project_identifier)%}">{%$params['notice']->project_name%}</a> 问题 <a href="#">#{%$params['notice']->workflow_number%}</a> {%$params['action']%}</p>
			</div>
		</div>
	</div>
</div>