<%@ page language="java" import="java.util.*,com.csh.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	if (!LoginControlPublicServlet.LoginSessionValidate(request, response, 1))
		return;
	Pagination paging = (Pagination) request.getAttribute("page");
%>


<!DOCTYPE html>
<!-- saved from url=(0041)http://www.youngrabbit.com/zh_CN/admin/dashboard/ -->
<html lang="zh-CN">
<head>
<%@include file="yb_db_head_include.jsp"%>
<title>admin management</title>
<script src="<%=path%>/js/iform.js"></script>
</head>
<body>
	<%@include file="yb_db_nav.jsp"%>
	<%@include file="yb_db_left_nav.jsp"%>
	<div class="container">
		<h2>用户管理</h2>
		<ul class="nav nav-tabs">
			<li><a href="<%=path%>/company/sales_manage">销售管理 </a></li>
			<li class="active"><a href="<%=path%>/company/admin_manage"> 管理员 </a></li>
			<li><a href="<%=path%>/customer/users_manage"> 顾客管理</a></li>
			<!--<li><a href="<%=path%>/company/recruiter_manage">招聘管理</a></li>-->
			<li><a href="<%=path%>/company/staff_upgrade?method=staff_list"> 员工升级 </a></li>
		</ul>
		<div id="emsg_id"></div>
		<div id="myTabContent2" class="tab-content">
			<!--管理员-->
			<div id="ADMIN">
				<div id="admin_list" class="table-responsive">
					<!--
					<div class="form-inline" col-md-12>
						<div class="btn-group">
							<select class="form-control largcontrol" id="USERS" name="USERS">
							<option value ="USER_ID">管理员编号</option>
							<option value ="EMAIL">电子邮箱</option>
							<option value="USERNAME">管理员姓名</option>
							</select>
						</div>
						<input type="text" id="SEARCH" name="SEARCH" class="form-control largcontrol" placeholder="请输入搜索内容">
						<button type="button" class="btn btn-default" onclick="query_admin();">搜索</button>
					</div>
					-->
					<table class="table table-striped" style="border: 0px solid #eee;">
						<thead>
							<tr>
								<!-- 对应管理人员 -->
								<th>序号</th>
								<th>姓名</th>
								<th>编号</th>
								<th>邮箱</th>
								<th>电话</th>
								<th>类型</th>
								<th>操作
									<button type="button" class="btn btn-xs btn-primary" onclick="add_admin();">添加管理员</button>
								</th>
							</tr>
						</thead>
						<tbody id="admin">
							<script id="tpl_admin" type="text/x-handlebars-template">
								{{#each this}}
									<tr>
										<td>{{addOne @index}}</td>
										<td>{{USERNAME}}</td>
										<td>{{USER_ID}}</td>
										<td>{{EMAIL}}</td>
										<td>{{PHONE}}</td>
										<td>{{help_role ROLE}}</td> 
										<td>
											<button type="button" class="btn btn-sm btn-success" onclick="upd_admin('{{USER_ID}}','{{FIRST_NAME}}','{{LAST_NAME}}','{{EMAIL}}','{{ROLE}}','{{PHONE}}','{{WECHAT}}','{{FACEBOOK}}');">修改</button>
											<button type="button" class="btn btn-sm btn-danger" onclick="del_admin('{{USER_ID}}');">删除</button>
										</td>
									</tr>
								{{/each}}
								 </script>
						</tbody>
					</table>
					<!-- 分页开始 -->
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li><select style="width: 150px;" class="form-control largcontrol" id="PAGE_SIZE" name="PAGE_SIZE"></select></li>
							<li><span aria-hidden="true"> 当前是第：<%=paging.getCurrentPage()%>页|共<%=paging.getTotalPage()%>页
							</span></li>
							<li><a style="cursor: pointer" onclick="pagination(1,<%=paging.getPageSize()%>);return false;">首页</a></li>
							<li><a style="cursor: pointer" onclick="pagination(<%=paging.getFirstPage()%>,<%=paging.getPageSize()%>);return false;">上一页</a></li>
							<li><a style="cursor: pointer" onclick="pagination(<%=paging.getDownPage()%>,<%=paging.getPageSize()%>);return false;">下一页</a></li>
							<li><a style="cursor: pointer" onclick="pagination(<%=paging.getTotalPage()%>,<%=paging.getPageSize()%>);return false;">尾页</a></li>
						</ul>
					</nav>
					<!-- 分页结束 -->
				</div>
			</div>
			<!--管理员结束-->
			<!-- 添加管理员 -->
			<div id="admin_add" style="display: none">
				<p class="text-center">添加/修改管理员</p>
				<form id="form" method="post">
					<input type="hidden" name="OP" id="OP" /> <input type="hidden" name="USER_ID" id="USER_ID">
					<div class="form-horizontal smalldiv">
						<div class="form-group">
							<div class="col-md-12">
								名称：<input class="form-control largcontrol" id="FIRST_NAME" name="FIRST_NAME" type="text"> <span class="text-danger" style="display: none;">名称为1～20个汉字、字母或数字。</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								姓氏：<input class="form-control largcontrol" id="LAST_NAME" name="LAST_NAME" type="text"> <span class="text-danger" style="display: none;">姓氏为1～20个汉字、字母或数字。</span>
							</div>
						</div>
						<div id="EMAIL_Div" class="form-group">
							<div class="col-md-12">
								电子邮箱：<input class="form-control largcontrol" id="EMAIL" name="EMAIL" type="text"> <span class="text-danger" style="display: none;">电子邮箱格式有误。</span>
							</div>
						</div>
						<div id="PWD_Div" class="form-group">
							<div class="col-md-12">
								密码：<input class="form-control largcontrol" id="PWD" name="PWD" type="text"> <span class="text-danger" style="display: none;">密码由6～20个字母、数字、下划线组成。</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								角色：<select class="form-control largcontrol" id="ROLE" name="ROLE" ></select> <span class="text-danger" style="display: none;">请选择角色。</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								电话：<input class="form-control largcontrol" id="PHONE" name="PHONE" type="text"> <span class="text-danger" style="display: none;">请输入正确的电话号码。</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								微信：<input class="form-control largcontrol" id="WECHAT" name="WECHAT" type="text"> <span class="text-danger" style="display: none;">请输入正确的微信号。</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								Facebook：<input class="form-control largcontrol" id="FACEBOOK" name="FACEBOOK" type="text"> <span class="text-danger" style="display: none;">Facebook格式有误。</span>
							</div>
						</div>
						<div class="form-group text-center">
							<!-- 	<input value="确定" class="btn btn-qubico" type="submit">-->
							<button type="button" class="btn btn-qubico" onclick="add();">确定</button>
							<button type="button" class="btn btn-qubico" onclick="back();">返回</button>
						</div>
					</div>
				</form>
			</div>
			<!--管理员结束-->
		</div>
	</div>
	<script>
	  
	   <%String admin_json = (String) request.getAttribute("admin_list");
			if (admin_json == "") {
				admin_json = "[]";
			}%>
       var obj, rows =<%=admin_json%>;

		Handlebars.registerHelper("addOne",function(index){
			return parseInt(index) + 1;
      });
		
		function add(){
			obj.submit();
		}
		function back(){
			admin_add.style.display = "none";
			admin_list.style.display = "";
		}
		
		function cb(arr,msg){	
			if(msg.show_msg){
				show_msg_warn("emsg_id",msg.msg_content);
			}
			setTimeout(function() {
				window.location.reload();
			}, __warn_period);
		}
		function fcb(robj){			
			show_msg_warn("emsg_id",robj.emsg);				
		}
		
		
		
		function add_admin(){
			var row = {"OP":1,"FIRST_NAME":"","LAST_NAME":"","EMAIL":"","PWD":"","ROLE":"", "PHONE":"", "WECHAT":"", "FACEBOOK":""};
			obj.init_object(row);
			admin_list.style.display = "none";
			admin_add.style.display = "";
			
			document.getElementById("EMAIL").readOnly=false;			
			document.getElementById("PHONE").readOnly=false;
			document.getElementById("WECHAT").readOnly=false;
			document.getElementById("FACEBOOK").readOnly=false;
			document.getElementById("ROLE").disabled=false;
			//document.getElementById('EMAIL_Div').style.display="";
			//document.getElementById('PWD_Div').style.display="";
			//return false;
		}
		function upd_admin(USER_ID,FIRST_NAME,LAST_NAME,EMAIL,ROLE,PHONE,WECHAT,FACEBOOK){
			var row = {"OP":2, "USER_ID":USER_ID,"EMAIL":EMAIL,"PWD":"","FIRST_NAME":FIRST_NAME,"LAST_NAME":LAST_NAME,"ROLE":ROLE, "PHONE":PHONE, "WECHAT":WECHAT, "FACEBOOK":FACEBOOK};
			obj.init_object(row);
			admin_list.style.display = "none";
			admin_add.style.display = "";
			document.getElementById("EMAIL").readOnly=true;
			document.getElementById("PHONE").readOnly=true;
			document.getElementById("WECHAT").readOnly=true;
			document.getElementById("FACEBOOK").readOnly=true;
			document.getElementById("ROLE").disabled=true;
			
		}
			
		function del_admin(USER_ID){
			if(confirm("确定要删除该管理员吗？")){
				var params = ["OP=3&userId=", USER_ID].join("");
				ims_submit_ajax("<%=path%>/company/admin_manage", params, cb,fcb);	
			}
		}
		 
		function query_admin(){
			var users=document.getElementById('USERS').value;		
			var searchUsers=document.getElementById('SEARCH').value;			
			var params = ["OP=4&users=",users+"&searchUsers=",searchUsers].join("");
			ims_submit_ajax("<%=path%>/company/admin_manage", params, d_cb);	
			
		}
				
		Handlebars.registerHelper("help_role", function (ROLE) {
			if (ROLE == 1024)
				return "管理员";
			else if (ROLE == 2048)
				return "超级管理员";			
		});		
		
		var tpl_admino = document.getElementById('tpl_admin');
		var tpl_admint = Handlebars.compile(tpl_admino.innerHTML);
		var admin = document.getElementById('admin');
		
		//admin.innerHTML = tpl_admint(rows);
		
		if(rows.length==0){
			admin.innerHTML="暂无数据！";
		}else{
			admin.innerHTML = tpl_admint(rows);
		}
		
		
		function ims_show_warn(){
			this.nextElementSibling.style.display = "";
		}
		function verify(){
			if(this.value){			
			var o = validator.is_name(validator.trim(this.value), this.minLength, this.maxLength);
			o ? this.nextElementSibling.style.display = "none" : this.nextElementSibling.style.display = "";
		}}
		function verify2(){
			if(this.value){
			var o = validator.is_email(validator.trim(this.value), this.minLength, this.maxLength);
			o ? this.nextElementSibling.style.display = "none" : this.nextElementSibling.style.display = "";
		}}
		function verify3(){
			if(this.value){
			var o = validator.is_password(validator.trim(this.value), this.minLength, this.maxLength);
			o ? this.nextElementSibling.style.display = "none" : this.nextElementSibling.style.display = "";
		}}
		function verify4(){
			if(this.value){
			var o = validator.is_phone(validator.trim(this.value), this.minLength, this.maxLength);
			o ? this.nextElementSibling.style.display = "none" : this.nextElementSibling.style.display = "";
			}}
		function verify5(){
			if(this.value){
			var o = validator.is_wechat(validator.trim(this.value), this.minLength, this.maxLength);
			o ? this.nextElementSibling.style.display = "none" : this.nextElementSibling.style.display = "";
			}}		
	
		function pagination(current_page,page_size){
			window.location.href="<%=path%>/company/admin_manage?current_page="+current_page+"&page_size="+page_size;
		}
		
		var arr0 = [["5","每页5条"],["10","每页10条"],["15","每页15条"],["20","每页20条"]];
		$( "#PAGE_SIZE" ).change(function() {
			var page_size=this.value;
			window.location.href="<%=path%>/company/admin_manage?page_size="+page_size;
		});
		
		function checkform(){
			if(OP.value==1){
				if(ROLE.value==""){
					var o=ROLE.nextElementSibling;
					o.style.display = "" ;
					setTimeout(function() {
						o.style.display = "none" ;
					}, __warn_period);
					return false;
				}
				if(PWD.value==""){
					var o=PWD.nextElementSibling;
					o.style.display = "" ;
					setTimeout(function() {
						o.style.display = "none" ;
					}, __warn_period);
					return false;
				}
				return true;
				
			}
			
			if(OP.value==2){
				
				return true;
			}
			
		}
		
		var arr1 = [["1024","管理员"],["2048","超级管理员"]];
		var cols = [
			{id:"form", 
				submit: {
					integrate:checkform,
					postform: submitWindow,
					url: "<%=path%>/company/admin_manage",
					refresh : cb,
					prompt:fcb,
			}}, 
			{
				id : "PAGE_SIZE",
				init : {
					multiple : false,
					vdefault : <%=paging.getPageSize()%>,
					value : 0,
					text : 1,
					ds : arr0
				}
			}, 
		    {id : "OP",init : {}},    //OP是标志位 1:添加  2:修改 3:删除  4:查询
		    {id : "USER_ID",init : {}},
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
				init:{minLength:6, maxLength:20, size:32, allowNull:true},
				event:{id:"onkeyup",fn:verify3},
				submit:{formatter:validator.trim, check:validator.is_password}},
			{id:"ROLE",
				init:{multiple:false,vdefault:512,value:0,text:1,ds:arr1}}, 
			{id:"PHONE", tips:{action:ims_show_warn, text:"电话"},
				init:{minLength:7, maxLength:15, size:32, allowNull:false},
				event:{id:"onkeyup",fn:verify4},
				submit:{formatter:validator.trim, check:validator.is_phone}},
			{id:"WECHAT", tips:{action:ims_show_warn, text:"微信"},
				init:{minLength:5, maxLength:20, size:32, allowNull:false},
				event:{id:"onkeyup"},
				submit:{formatter:validator.trim}},
			{id:"FACEBOOK", tips:{action:ims_show_warn, text:"Facebook"},
				init:{minLength:5, maxLength:50, size:32, allowNull:false},
				event:{id:"onkeyup"},
				submit:{formatter:validator.trim}},
			 ];

		window.onload = function() {
			obj = new iform(cols, document.forms[0]);
			obj.init_object([]);
		}

		if(rows.length==0){
			admin.innerHTML="暂无数据！";
		}else{
			admin.innerHTML = tpl_admint(rows);
		}
    </script>
	<%@include file="yb_db_foot_include.jsp"%>
</body>
</html>