<div class="row">
				<div class="col-md-1">
								<span class="glyphicon glyphicon-comment"></span>
				</div>
				<div class="col-md-11">
								<p><small>3 天前</small></p>
								<p><a href="{%baseUrl($params['account']->identifier)%}">{%$params['account']->realname%}</a> 对 <a href="{%baseUrl($params['account']->identifier|cat:'/'|cat:$params['notice']->project_identifier)%}">{%$params['notice']->project_name%}</a> 有新评论</p>
								<div class="row">
												<div class="col-md-1">
																<a href=""><img class="img-circle" src="assets/images/468149.png" width="40" height="40"></a>
												</div>
												<div class="col-md-11">
																{%$params['comment']%}
												</div>
								</div>
				</div>
</div>