<div class="account-notice-meta clearfix">
	<div class="account-notice-meta-title pull-left">
		<a href="{%baseUrl($params['notice']->account_identifier)%}">{%$params['notice']->account_realname%}</a> 关注了项目 <a href="{%baseUrl($params['notice']->account_identifier|cat:'/'|cat:$params['notice']->project_identifier)%}">{%$params['notice']->project_name%}</a>
	</div>
	<div class="account-notice-meta-time pull-right">
		6分钟前
	</div>
</div>
<div class="account-notice-content">

</div>