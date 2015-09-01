<div class="find-navbar-spaceholder"></div>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><strong>Find</strong> <small>用思想创造价值</small></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="搜索">
				</div>
			</form>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">首页</a></li>
				<li><a href="#">特性</a></li>
				<li><a href="#">探索</a></li>
			</ul>
			<div class="navbar-right find-index-nav-loading">
				<i class="fa fa-ellipsis-v"></i>
			</div>
			<div class="navbar-right find-index-nav-button">
				<a class="btn btn-info" href="#">注册</a>
				<a class="btn btn-default" href="{%baseUrl('login')%}">登录</a>
			</div>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>