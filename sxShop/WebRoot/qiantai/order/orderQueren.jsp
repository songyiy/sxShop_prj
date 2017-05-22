<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
    
    <link rel="stylesheet" href="<%=path %>/css/qiantai.css" type="text/css" media="all" />
    
    <script language="javascript">
            function back1()
	        {
	           var url="<%=path %>/myCart.action";
	           window.location.href=url;
	        }
	        
	        function dd()
	        {
	            var odderFukuangfangshi=document.f.odderFukuangfangshi.value;
	            //alert(odderFukuangfangshi);
	            if(odderFukuangfangshi=="银行付款")
	            {
	                 document.getElementById("qufukuan").style.display="block";
	            }
	            if(odderFukuangfangshi=="货到付款")
	            {
	                 document.getElementById("qufukuan").style.display="none";
	            }
	        }
	        
	        function kahao()
	        {
	            var strUrl = "<%=path %>/qiantai/order/kahao.jsp";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:700px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
	        }
        </script>
    
  </head>
  
<body>
<div id="header">
	<div class="shell">
		<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include> 
	</div>
</div>


<div align="center" style="margin-top: 7px;">
<table border="0" align="center">
<tr>
     <td width="800" valign="top" align="left">
				<div class="box">
					<div class="box-head">
						<h2 class="left">&nbsp;</h2>
						<div class="right">&nbsp;</div>
					</div>
					<div class="table" style="height: 100%;margin-top: 10px;margin-left: 10px;">
						<form action="<%=path %>/orderSubmit.action" name="f" method="post">
		                        <table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="right">收货人帐号：</td>
					                  <td width="80%" align="left">
					                      <input type="text" name="userName" readonly="readonly" value="<s:property value="#session.user.userName"/>" style="width: 288px;"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="right">收货人姓名：</td>
					                  <td width="80%" align="left">
					                      <input type="text" name="userRealname" value="<s:property value="#session.user.userRealname"/>" style="width: 288px;"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="right">收货人联系电话：</td>
					                  <td width="80%" align="left">
					                      <input type="text" name="userTel" value="<s:property value="#session.user.userTel"/>" style="width: 288px;"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="right">送货地址：</td>
					                  <td width="80%" align="left"><input type="text" name="songhuodizhi" value="<s:property value="#session.user.userAddress"/>" style="width: 288px;"/></td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="right">付款方式：</td>
					                  <td width="80%" align="left">
		   		                          <select name="fukuanfangshi" style="width:293px;" onchange="dd()">
		   		                               <option value="货到付款">货到付款</option>
		   		                               <option value="银行付款">银行付款</option>
		   		                          </select>
		   		                          <!-- <input type="button" onclick="kahao()" id="qufukuan" style="display: none" value="查看卡号"/> -->
		                              </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="right">&nbsp;</td>
					                  <td width="80%" align="left">
					                       <input type="button" value="返回修改" onclick="back1()" style="width: 130px;"/>
					                       <input type="button" value="提交订单" onclick="javascript:document.f.submit();" style="width: 130px;"/>
		                              </td>
					              </tr>
		        				</table>
				        </form>
					</div>
				</div>
     </td> 
     <td width="1">&nbsp;</td>
     <td width="200" valign="top" align="left">
        <jsp:include flush="true" page="/qiantai/right.jsp"></jsp:include>
     </td>
</tr>
</table>
</div>



<div id="footer">
	<div class="shell">
		<span class="left"></span>
		<span class="right">
			<a href="<%=path %>/login.jsp">系统后台</a>
		</span>
	</div>
</div>
	
</body>
</html>
