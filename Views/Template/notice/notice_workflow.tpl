<div class="row">
				<div class="col-md-1">
								<span class="glyphicon glyphicon-question-sign"></span>
				</div>
				<div class="col-md-11">
								<p><small>3 天前</small></p>
								<p><a href="{%baseUrl($params['account']->identifier)%}">{%$params['account']->realname%}</a> 将 <a href="{%baseUrl($params['account']->identifier|cat:'/'|cat:$params['notice']->identifier)%}">{%$params['notice']->name%}</a> 问题 <a href="#">#40293</a> 状态变更为 处理中</p>
								<div class="row">
												<div class="col-md-1">
																<a href=""><img class="img-circle" src="assets/images/468149.png" width="40" height="40"></a>
												</div>
												<div class="col-md-11">
																{%$params['notice']->description%}
												</div>
								</div>
				</div>
</div>