<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html class=" js flexbox flexboxlegacy canvas canvastext webgl touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba no-hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths" style="" lang="en-US"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta property="og:site_name" content="YoungRabbit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Young Rabbit Register</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="http://redbeard.io/Content/images/favicon.ico">
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/qubico.css">
    <link href="../css/css_002.css" rel="stylesheet" type="text/css">
    <link href="../css/css.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../css/modal.css">
	<script src="../js/jquery"></script>
    <script src="../js/jqueryval"></script>
    <script src="../js/iform.js"></script>
    <script>
        var baseUrl = "http://#";
    </script>
</head>
<body data-spy="scroll" data-target="#main-nav" data-offset="400">
    <div id="main-nav" class="navbar navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#site-nav">
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="http://#" title="Redbeard">
                    <span class="logo-small"><img src="../image/Logo.png" alt=""></span>
                </a>
            </div>
            <div id="site-nav" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="http://#" title="主页">主页</a>
                    </li>
                    <li>
                        <a href="http://#" title="产品">产品</a>
                    </li>
                    <li>
                        <a href="http://#" title="公司概况">公司概况</a>
                    </li>
                    <li>
                        <a href="http://#" title="加入我们">加入我们</a>
                    </li>
                    <li>
                        <a href="http://#" title="Agent List">代理</a>
                    </li>
                    <li>
                        <a href="https://#" title="Message">Message</a>
                    </li>
					<li class="seperator hidden-xs"></li>
					<li>
						<a href="http://#" class="loginlink">
							<input value="登陆" class="btn btn-login" type="submit">
						</a>
					</li>
                </ul>
            </div>
        </div>
    </div>
    
	<section id="register" class="white-bg padding-top-bottom">
		<div class="container">
			<div class="smalldiv">
				<h1 class="section-title">创建一个账号</h1>
				<p class="text-center">Let's build something awesome together!</p>
				<form id="form" method="post">
					<input type="hidden" name="ROLE" id="ROLE" value="1"/>
					<div class="form-horizontal">
						<div class="form-group">
							<div class="col-md-12">
								<input class="form-control largcontrol" id="FIRST_NAME" name="FIRST_NAME" type="text">
								<span class="text-danger" style="display:none;">名称为1～20个汉字、字母或数字。</span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-12">
								<input class="form-control largcontrol" id="LAST_NAME" name="LAST_NAME" type="text">
								<span class="text-danger" style="display:none;">姓氏为1～20个汉字、字母或数字。</span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-12">
								<input class="form-control largcontrol" id="EMAIL" name="EMAIL" placeholder="Email" type="text">
								<span class="text-danger" style="display:none;">电子邮箱格式有误。</span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-12">
								<input class="form-control largcontrol" id="PWD" name="PWD" placeholder="Password" value="" type="password">
								<span class="text-danger" style="display:none;">密码由6～20个字母、数字、下划线组成。</span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-12">
								<input class="form-control largcontrol" id="PWD_VERIFY" name="PWD_VERIFY" placeholder="Confirm password" type="password">
								<span class="text-danger" style="display:none;">密码由6～20个字母、数字、下划线组成。</span>
								<span id="pv" class="text-danger" style="display:none;">密码和验证密码不一致。</span>
							</div>
						</div>
						<div class="form-group text-center">
							<input value="创建" class="btn btn-qubico" type="submit">
						</div>
					</div>
				</form>            
				<div class="text-center"><p>Already have an  account?  <a href="http://#">login here</a></p></div>
			</div>
		</div>
	</section>	
	<script>
		var obj, rows = [];
		function ims_show_warn(){
			this.nextElementSibling.style.display = "";
		}
		function verify(){
			var o = validator.is_name(validator.trim(this.value), this.minLength, this.maxLength);
			o ? this.nextElementSibling.style.display = "none" : this.nextElementSibling.style.display = "";
		}
		function verify2(){
			var o = validator.is_email(validator.trim(this.value), this.minLength, this.maxLength);
			o ? this.nextElementSibling.style.display = "none" : this.nextElementSibling.style.display = "";
		}
		function verify3(){
			var o = validator.is_password(validator.trim(this.value), this.minLength, this.maxLength);
			o ? this.nextElementSibling.style.display = "none" : this.nextElementSibling.style.display = "";
		}
		function check_form(){
			if(PWD.value == PWD_VERIFY.value)
				return true;
			else{
				pv.style.display = "";
				setTimeout(function () { 
					pv.style.display = "none";
				}, 3000);
				return false;
			}
		}
		
		function next_register_step(dataObj){
				//convert josn to object
				alert(dataObj);
				$.each(dataObj.USER,function(idx, item) {
						//$('#imageid').val(item.imageid_1);
						alert(item.USER_ID);
				});			
		}
		
		var cols = [
			{id:"form", 
				submit: {
					integrate:check_form,
					postform: submitWindow,
					url: '<%=path%>/servlet/register?step=1',
					refresh: next_register_step,
				}},	
			{id:"ROLE", init:{}},
			{id:"FIRST_NAME", tips:{action:ims_show_warn, text:"名称"},
				init:{minLength:1, maxLength:20, size:32, allowNull:false},
				event:{id:"onkeyup",fn:verify},
				submit:{formatter:validator.trim, check:validator.is_name}},
			{id:"LAST_NAME", tips:{action:ims_show_warn, text:"姓氏"},
				init:{minLength:1, maxLength:20, size:32, allowNull:false},
				event:{id:"onkeyup",fn:verify},
				submit:{formatter:validator.trim, check:validator.is_name}},
			{id:"EMAIL", tips:{action:ims_show_warn, text:"电子邮箱"},
				init:{minLength:1, maxLength:50, size:32, allowNull:false},
				event:{id:"onkeyup",fn:verify2},
				submit:{formatter:validator.trim, check:validator.is_email}},
			{id:"PWD", tips:{action:ims_show_warn, text:"密码"},
				init:{minLength:6, maxLength:20, size:32, allowNull:false},
				event:{id:"onkeyup",fn:verify3},
				submit:{formatter:validator.trim, check:validator.is_password}},
			{id:"PWD_VERIFY", tips:{action:ims_show_warn, text:"验证密码"},
				init:{minLength:6, maxLength:20, size:32, allowNull:false},
				event:{id:"onkeyup",fn:verify3},
				submit:{formatter:validator.trim, check:validator.is_password}},
		];

		window.onload = function() {
			obj = new iform(cols, document.forms[0]);
			obj.init_object(rows);	
		}
	</script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery_003.js"></script>
    <script src="../js/jquery_006.js"></script>
    <script src="../js/waypoints.js"></script>
    <script>
    $(document).ready(function () {
        $(window).scroll(function() {
        if ($(this).scrollTop() >= 50) { 
            $('#main-nav').addClass('header-border');
        }else
            $('#main-nav').removeClass('header-border');
        });
    });
    </script>
	</body>
</html>