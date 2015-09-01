<div class="account-notice-meta clearfix">
	<div class="account-notice-meta-title pull-left">
		<a href="{%baseUrl($params['notice']->account_identifier)%}">{%$params['notice']->account_realname%}</a> 将 <a href="{%baseUrl($params['notice']->identifier|cat:'/'|cat:$params['notice']->project_identifier)%}">{%$params['notice']->project_name%}</a> 问题 <a href="#">#{%$params['notice']->workflow_number%}</a> {%$params['action']%}
	</div>
	<div class="account-notice-meta-time pull-right">
		6分钟前
	</div>
</div>
<div class="account-notice-content">
	<a href="#">#{%$params['notice']->workflow_number%}</a> {%$params['notice']->workflow_title%}
</div>