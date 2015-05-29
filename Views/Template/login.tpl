<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发现 - 登录</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/login.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="container-fluid site-wrapper with-shadow">
    <div class="nest-container">

        {%include file="std_nav.tpl"%}
        <div class="login-content">
            <div class="login-container">
                <div class="login-panel">
                    <form method="get" action="{%baseUrl('johnnyeven')%}">
                        <h3>登录</h3>
                        <div class="form-group">
                            <label for="iptUsername">用户名</label>
                            <input type="text" class="form-control" id="iptUsername" name="iptUsername" placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label for="iptPassword">密码</label>
                            <input type="password" class="form-control" id="iptPassword" name="iptPassword">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="chkRemember" name="chkRemember"> 自动登录
                            </label>
                        </div>
                        <div class="form-group clearfix">
                            <button type="submit" class="btn btn-lg btn-default pull-right ">登录</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        {%include file="std_footer.tpl"%}
    </div>
</div>

</body>
</html>
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>