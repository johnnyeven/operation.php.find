<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发现 - 注册</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/register.css">
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
        <div class="register-content">
            <div class="register-container">
                <div class="register-panel">
                    <form method="get" action="{%baseUrl('johnnyeven')%}">
                        <div class="form-step" id="step1">
                            <h3>学校</h3>
                            <div class="form-group">
                                <label for="iptHighschool">大学</label>
                                <input type="text" class="form-control" id="iptHighschool" name="iptHighschool">
                            </div>
                            <div class="form-group">
                                <label for="iptProfession">专业</label>
                                <input type="text" class="form-control" id="iptProfession" name="iptProfession">
                            </div>
                            <div class="form-group">
                                <label for="iptName">真实姓名</label>
                                <input type="text" class="form-control" id="iptName" name="iptName">
                            </div>
                            <div class="form-group clearfix">
                                <button id="btnNext" type="button" class="btn btn-success pull-right ">下一步</button>
                            </div>
                        </div>
                        <div class="form-step" id="step2" style="display: none;">
                            <h3>基本信息</h3>
                            <div class="alert alert-success" role="alert"><strong>注册成功</strong> 正在跳转...</div>
                            <div class="form-group">
                                <label for="iptUsername">用户名</label>
                                <input type="text" class="form-control" id="iptUsername" name="iptUsername">
                            </div>
                            <div class="form-group">
                                <label for="iptPassword">密码</label>
                                <input type="text" class="form-control" id="iptPassword" name="iptPassword">
                            </div>
                            <div class="form-group">
                                <label for="iptPasswordConfirm">确认密码</label>
                                <input type="text" class="form-control" id="iptPasswordConfirm" name="iptPasswordConfirm">
                            </div>
                            <div class="form-group clearfix">
                                <button id="btnPrev" type="button" class="btn btn-success pull-left ">上一步</button>
                                <button id="btnSubmit" type="submit" class="btn btn-success pull-right ">完成注册</button>
                            </div>
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
<script type="text/javascript" src="/assets/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/assets/js/register.js"></script>