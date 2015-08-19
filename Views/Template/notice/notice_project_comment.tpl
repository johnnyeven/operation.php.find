<div class="row">
	<div class="col-md-1">
		<span class="glyphicon glyphicon-comment"></span>
	</div>
	<div class="col-md-11">
		<p><small>3 天前</small></p>
		<div class="row">
			<div class="col-md-1">
				<a href=""><img class="img-circle" src="assets/images/468149.png" width="40" height="40"></a>
			</div>
			<div class="col-md-11">
				<p><a href="{%baseUrl($params['notice']->account_identifier)%}">{%$params['notice']->account_realname%}</a> 对 <a href="{%baseUrl($params['notice']->account_identifier|cat:'/'|cat:$params['notice']->project_identifier)%}">{%$params['notice']->project_name%}</a> 有新评论</p>
				<p>{%$params['comment']%}</p>
			</div>
		</div>
	</div>
</div>