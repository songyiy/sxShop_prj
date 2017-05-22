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
		    function login()
	        {
	           if(document.userLogin.userName.value=="")
	           {
	               alert("请输入用户名");
	               return;
	           }
	           if(document.userLogin.userPw.value=="")
	           {
	               alert("请输入密码");
	               return;
	           }
	           document.userLogin.submit();
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
						<form action="<%=path %>/userLogin.action" name="userLogin" method="post">
						<table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
					        <tr>
					            <td align="center" colspan="2" height="10"></td>
					          </tr>
					          <tr>
					            <td align="right" width="15%" height="30" style="font-size: 11px;">账号：</td>
					            <td align="left" width="85%"><input name="userName" type="text" style="width: 260px;"/></td>
					          </tr>
					          <tr>
					            <td align="right" height="30" style="font-size: 11px;">密码：</td>
					            <td align="left"><input type="password" style="width: 260px;" name="userPw"/></td>
					          </tr>
					          <tr>
					            <td align="right" height="30" style="font-size: 11px;">&nbsp;</td>
					            <td align="left">
					               <input type="button" value="登陆" onclick="login()" style="width: 100px;"/>
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
