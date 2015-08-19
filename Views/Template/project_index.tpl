<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发现 - 用思想创造价值 - 智能管车</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/project-index.css">
    <link rel="stylesheet" href="/assets/css/markdown-theme-dawn.css">
    <link rel="stylesheet" href="/assets/css/desert-cmd.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="with-shadow"></div>
<div class="container-fluid site-wrapper">
    <div class="nest-container">

        {%include file="std_nav.tpl"%}
        <div class="spaceholder"></div>

        <div class="project-content container">
            <div class="row project-title">
                <div class="col-md-12">
                    <div class="pull-left">
                        {%include file="project_title.tpl"%}
                    </div>
                    <div class="pull-right">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-danger active">取消关注</button>
                            <button type="button" class="btn btn-danger">申请加入</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    {%include file="project_sidebar.tpl"%}
                </div>
                <div class="col-md-10">
                    <ol class="breadcrumb">
                        <li class="active">主页</li>
                    </ol>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><span class="glyphicon glyphicon-user"></span> 成员 <span class="badge">{%$params['memberCount']%}</span></h3>
                                </div>
                                <ul class="list-group">
                                    {%foreach $params['roles'] as $name => $members%}
                                    <li class="list-group-item">{%$name%}
                                        {%foreach $members as $member%}
                                            <a href="#">{%$member->realname%}</a>
                                        {%/foreach%}
                                    </li>
                                    {%/foreach%}
                                    <li class="list-group-item"><button class="btn btn-info form-control">查看全部</button></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><span class="glyphicon glyphicon-time"></span> 活动</h3>
                                </div>
                                <ul class="list-group">
                                    {%foreach $params['notices'] as $notice%}
                                    {%$notice->format(TRUE)%}
                                    {%/foreach%}
                                    <li class="list-group-item"><button class="btn btn-info form-control">查看全部</button></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><span class="glyphicon glyphicon-heart"></span> 项目介绍</h3>
                                </div>
                                <div class="panel-body markdown-content">
                                    <h1 data-anchor-id="bkbe" id="operationphp-framework-用户手册">Operation.PHP Framework 用户手册</h1>

                                    <p data-anchor-id="402i"><code class="code-black">operation.php</code> <code class="code-black">用户手册</code></p>

                                    <hr>

                                    <div class="md-section-divider"></div>

                                    <h2 data-anchor-id="4x47" id="1什么是operationphp">1.什么是Operation.PHP</h2>

                                    <p data-anchor-id="du0y"><a href="https://github.com/johnnyeven/operation.php" target="_blank">Operation.PHP</a> 是一个基于PHP的轻型框架。请大家不要把他看作是一个大型框架，我开发这个框架的目的就是希望把繁琐的操作简化，并且不希望引入太多的累赘功能。</p>

                                    <p data-anchor-id="82q6">所以，我把扩展性作为首要考虑的功能之一。<a href="https://github.com/johnnyeven/operation.php" target="_blank">Operation.PHP</a> 吸收了CodeIgniter框架的有点，适合敏捷开发，同时又改造了CodeIgniter框架中路由的功能，让框架更灵活自由。</p>

                                    <div class="md-section-divider"></div>

                                    <h2 data-anchor-id="7ged" id="2operationphp能做什么">2.Operation.PHP能做什么</h2>

                                    <ul data-anchor-id="3zbg">
                                        <li><a href="https://github.com/johnnyeven/operation.php" target="_blank">Operation.PHP</a> 中支持多App公用一套系统内核，配置非常方便，不同的App可以有自己独立的配置。</li>
                                        <li>你的项目需要支持多语言吗？没问题，在<a href="https://github.com/johnnyeven/operation.php" target="_blank">Operation.PHP</a> 中这仅仅是一个配置的问题，剩下的就是创建你的多语言文件了。</li>
                                        <li><a href="https://github.com/johnnyeven/operation.php" target="_blank">Operation.PHP</a> 还封装了Model层，你可以用更自然舒适的代码操作数据模型，就像这样：</li>
                                    </ul>

                                    <div class="md-section-divider"></div>

                                    <pre class="prettyprint linenums prettyprinted" data-anchor-id="6vdw"><ol class="linenums"><li class="L0"><code><span class="com">//class Account extends Model</span></code></li><li class="L1"><code><span class="pln">$account </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Account</span><span class="pun">::</span><span class="kwd">get</span><span class="pun">(</span><span class="pln">array</span><span class="pun">(</span></code></li><li class="L2"><code><span class="pln">    </span><span class="str">'username'</span><span class="pln">  </span><span class="pun">=&gt;</span><span class="pln">  </span><span class="str">'operation'</span></code></li><li class="L3"><code><span class="pun">));</span></code></li><li class="L4"><code><span class="pln">$account</span><span class="pun">-&gt;</span><span class="pln">email </span><span class="pun">=</span><span class="pln"> </span><span class="str">'admin@operationphp.com'</span><span class="pun">;</span></code></li><li class="L5"><code></code></li><li class="L6"><code><span class="kwd">if</span><span class="pun">(</span><span class="pln">$account</span><span class="pun">-&gt;</span><span class="pln">save</span><span class="pun">())</span></code></li><li class="L7"><code><span class="pun">{</span></code></li><li class="L8"><code><span class="pln">    </span><span class="com">//if success do something...</span></code></li><li class="L9"><code><span class="pun">}</span></code></li></ol></pre>

                                    <ul data-anchor-id="7qs8">
                                        <li>通过Connection组件，你可以很方便的在不同App之间相互调用，即使你App部署在不同的服务器。</li>
                                        <li>你可以使用Redis等NoSQL数据库充当你的缓存或者是Session管理工具，你甚至可以开发自己的驱动器取代Redis。</li>
                                        <li>通过Validation组件，你可以把你的参数验证过程简化为配置文件，以后你再也不需要冗长的if else语句来做参数判断了。</li>
                                        <li>你可以使用一下命令执行程序，当然你可以定制你自己的命令脚本。</li>
                                    </ul>

                                    <div class="md-section-divider"></div>

                                    <pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-bash"><span class="pln">php command app yourCommand</span></code></li></ol></pre>

                                    <ul data-anchor-id="m463">
                                        <li>你可以为你每一个App定义一个ErrorHandler类来处理抛出的异常。</li>
                                        <li>简单的扩展方式，所有用户自定义的扩展都在App下的Extend目录下，有Helpers、Hooks、Library，分别是扩展函数、钩子、组件。</li>
                                    </ul>

                                    <div class="md-section-divider"></div>

                                    <h2 data-anchor-id="nbxc" id="3基本信息">3.基本信息</h2>

                                    <ul data-anchor-id="j0tw">
                                        <li><a href="https://www.zybuluo.com/johnnyeven/note/97593" target="_blank">服务器需求</a></li>
                                        <li><a href="https://www.zybuluo.com/johnnyeven/note/97601" target="_blank">许可协议</a></li>
                                        <li><a href="https://www.zybuluo.com/johnnyeven/note/97608" target="_blank">变更记录</a></li>
                                        <li><a href="https://www.zybuluo.com/johnnyeven/note/97616" target="_blank">关于Operation.PHP</a></li>
                                        <li><a href="https://www.zybuluo.com/johnnyeven/note/97951" target="_blank">代码规范</a></li>
                                    </ul>

                                    <div class="md-section-divider"></div>

                                    <h2 data-anchor-id="gpxq" id="4安装">4.安装</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {%include file="std_footer.tpl"%}
    </div>
</div>

</body>
</html>
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>