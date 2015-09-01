<div class="account-notice-meta clearfix">
	<div class="account-notice-meta-title pull-left">
		<a href="{%baseUrl($params['notice']->account_identifier)%}"><img src="/assets/img/468149.png" class="img-circle" width="16" height="16"> {%$params['notice']->account_realname%}</a> 对 <a href="{%baseUrl($params['notice']->account_identifier|cat:'/'|cat:$params['notice']->project_identifier)%}">{%$params['notice']->project_name%}</a> 有新评论
	</div>
	<div class="account-notice-meta-time pull-right">
		6分钟前
	</div>
</div>
<div class="account-notice-content">
	{%$params['comment']%}
</div>