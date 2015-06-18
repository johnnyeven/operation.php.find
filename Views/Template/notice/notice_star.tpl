<div class="row">
				<div class="col-md-1">
								<span class="glyphicon glyphicon-star"></span>
				</div>
				<div class="col-md-11">
								<p><small>3 天前</small></p>
								<p></p><a href="{%baseUrl($params['account']->identifier)%}">{%$params['account']->realname%}</a> 关注了项目 <a href="{%baseUrl($params['account']->identifier|cat:'/'|cat:$params['notice']->project_identifier)%}">{%$params['notice']->project_name%}</a></p>
				</div>
</div>