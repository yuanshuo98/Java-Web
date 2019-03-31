<%@ page language="java" import="java.util.*,com.csh.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	PageModel pageModel = (PageModel) request.getAttribute("page");
	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="baseHeader_1.jsp"></jsp:include>

<script type="text/javascript">
  function ff(val){
	 alert("ff->"+val);
     window.location.href="<%=basePath%>servlet/webproducts?method=listWebProducts&currentPage="+val;
  }
  
  //清理参数
	function cleardivform(){
	  
	   alert("ff->cleardivform");
		$('#dataform').form('clear');
      	//还有问题
 }
  
function addGood(){
      alert("addGood");	
     
      window.location.href="<%=basePath%>jsp/products/addProduct.jsp";
 
}

 function searchConditionReport(){
	 var vreportYearSe=$("#reportYearSe").val();
	 var vreportMonthSe=$("#reportMonthSe").val();
	 var vreportStatusSe=$("#reportStatusSe").val();
	 var vreportDaySe=$("#reportDaySe").val();
	 alert("ff->1--"+vreportYearSe);
	  alert("ff->2--"+vreportMonthSe);
	   alert("ff->3--"+vreportStatusSe);
	   alert("ff->4--"+vreportDaySe);
	   if (vreportDaySe.length == 1)
	   {
		    vreportDaySe = "0"+vreportDaySe;
	   }else
	   {
		   vreportDaySe = vreportDaySe;
		}
	   alert("ff->5--"+vreportDaySe);
	 //window.location.href="<!--%=basePath%>servlet/webreportorders?method=listSearchWebOrders&reportYearSe="+vreportYearSe+"&reportMonthSe="+vreportMonthSe+"&reportStatusSe="+vreportStatusSe+"&reportDaySe="+vreportDaySe;
     // window.location.href="<%=basePath%>servlet/webreportorders?method=listWebOrders&currentPage="+val;
 
 }
  
   

</script>
<html>
	<body>
		<div class="wapper cbody">
			<div class="Ccontent left margin-top">
				<div id="position">
					<p>
						<a href="jsp/login.jsp">首页</a>&gt;
						<a href="jsp/login.jsp">商品信息列表</a>&gt;
					</p>
				</div>
				<div class="margin-top STYLE1" id="divsearch" region="north">
					<form action="" id="searchform">
						<table id="dataform" class="table_d">
							<tr>
								<td>
								       商品编号：
								</td>
								<td>
									<select id="reportYearSe" style="width: 80px;">

										<option value="2016" selected>
											2016
										</option>
										<option value="2017">
											2017
										</option>
										<option value="2018">
											2018
										</option>
										<option value="2019">
											2019
										</option>
										<option value="2020">
											2020
										</option>
										<option value="2021">
											2021
										</option>
									</select>
								</td>
								<td>
									商品名称：
								</td>
								<td>
									<select id="reportMonthSe" style="width: 80px;">
										<option value="<%=(new Date()).getMonth() + 1%>" selected>
											<%=(new Date()).getMonth() + 1%>
										</option>
										<option value="1">
											1
										</option>
										<option value="2">
											2
										</option>
										<option value="3">
											3
										</option>
										<option value="4">
											4
										</option>
										<option value="5">
											5
										</option>
										<option value="6">
											6
										</option>
										<option value="7">
											7
										</option>
										<option value="8">
											8
										</option>
										<option value="9">
											9
										</option>
										<option value="10">
											10
										</option>
										<option value="11">
											11
										</option>
										<option value="12">
											12
										</option>
									</select>
								</td>
                               <td>
									商品价格：
								</td>
								<td>
									<select id="reportDaySe" style="width: 80px;">
									    <option value="0">
											0
										</option>
										<option value="1">
											1
										</option>
										<option value="2">
											2
										</option>
										<option value="3">
											3
										</option>
										<option value="4">
											4
										</option>
										<option value="5">
											5
										</option>
										<option value="6">
											6
										</option>
										<option value="7">
											7
										</option>
										<option value="8">
											8
										</option>
										<option value="9">
											9
										</option>
										<option value="10">
											10
										</option>
										<option value="11">
											11
										</option>
										<option value="12">
											12
										</option>
										<option value="13">
											13
										</option>
										<option value="14">
											14
										</option>
										<option value="15">
											15
										</option>
										<option value="16">
											16
										</option>
										<option value="17">
											17
										</option>
										<option value="18">
											18
										</option>
										<option value="19">
											19
										</option>
										<option value="20">
											20
										</option>
										<option value="21">
											21
										</option>
										<option value="22">
											22
										</option>
										<option value="23">
											23
										</option>
										<option value="24">
											24
										</option>
										<option value="25">
											25
										</option>
										<option value="26">
											26
										</option>
										<option value="27">
											27
										</option>
										<option value="28">
											28
										</option>
										<option value="29">
											29
										</option>
										<option value="30">
											30
										</option>
										<option value="31">
											31
										</option>
									</select>
								</td>
								<td>
									状态：
								</td>
								<td>
									<select id="reportStatusSe" style="width: 80px;">
										<option value="0" selected>
											全部
										</option>
										<option value="1">
											上架
										</option>
										<option value="2">
											已下架
										</option>
										<option value="3">
											停售
										</option>
										<option value="4">
											其它
										</option>
									</select>
								</td>

								<td>
									<input type="text" id="noticeDateTwoFrom"
										name="noticeDateTwoFrom" class="easyui-datebox"
										style="width: 10px;" />
								</td>
								<td>
									<a class="easyui-linkbutton" plain="true" iconCls="icon-search"
										onclick="searchConditionReport()">查询</a>
								</td>
								<td>
									<a class="easyui-linkbutton" plain="true" iconCls="icon-cancel"
										onclick="cleardivform('#searchform')">清除</a>
								</td>
								<!--td>
									<input type="button" value="删除"
										onclick="deleteEnroll(${pe.userId})" />
								</td-->

								<td>
									<input type="button" value="添加商品"
										onclick="addGood()" />
								</td>
							</tr>
						</table>
					</form>
				</div>

				<div class="margin-top STYLE1" id="list2">

					<table cellspacing="0" cellpadding="0" width="100%">
						<tbody>
							<tr>
								<th style="text-align: left; padding-left: 15px;" width="100px">
									序号
								</th>
								<th width="300px">
									商品ID
								</th>
								<th width="300px">
									商品名称
								</th>
								<th width="300px">
									商品描述
								</th>
								<th width="300px">
									商品图片
								</th>
								<th width="300px">
									市场价格
								</th>
     							<th width="300px" align="left">
									折扣钱数
								</th>
								<th width="500px" align="left">
									商品状态
								</th>
								<th width="500px" align="left">
									操作
								</th>
							</tr>
							<c:forEach items="${page.list}" var="pe" varStatus="status">
							  <tr class="alist00" align="center"  rowspan="3" >
							      <td>
							         ${status.count}
							      </td>
							      <td>
							         ${pe.goodId}
							      </td>
							      <td>
							         ${pe.title}
							      </td>
							       <td>
							         ${ pe.description }
							      </td>
									<td width="159" rowspan="1" bordercolor="1">
										<img src="img/${pe.imagesId}.jpg" width="60px;" height="50px;" />
									</td>
									
									<td>
							         ${ pe.pricing }
							      </td>
									     		      
							       <td>
							         ${pe.compareAtPrice}
							      </td>
							  
                                  <td>
							         ${pe.status}
							      </td>
                                  <td>
							         &nbsp;&nbsp;
							         <input type="button" value="商品明细" onclick="showEnroll(${pe.goodId})"/>
							      </td>
							  </tr>							
							</c:forEach>
						</tbody>
					</table>
					当前：<%=pageModel.getCurrentPage()%>页|共<%=pageModel.getTotalPage()%>页
					<a style="cursor:pointer"  onclick="ff(1);return false;">首页</a>
					<a style="cursor:pointer" onclick="ff(<%=pageModel.getFirstPage()%>);return false;">上一页</a>
					<a style="cursor:pointer" onclick="ff(<%=pageModel.getDownPage()%>);return false;">下一页</a>
					<a style="cursor:pointer" onclick="ff(<%=pageModel.getTotalPage()%>);return false;">尾页</a>
				</div>
			</div>
		</div>
	</body>
</html>


