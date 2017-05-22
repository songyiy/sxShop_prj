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
    <style rel="stylesheet" type="text/css">
		.c1-bline{border-bottom:#999 1px dashed;border-top:1px;}
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
	</style>
    <script language="javascript">
		  
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
						<c:forEach items="${requestScope.xinwenList}" var="xinwen">
						   <div class="c1-bline">
						       <div class="f-left" style="margin-top: 15px;">
							     <img src="<%=path %>/img/head-mark4.gif" align="middle" class="img-vm" border="0"/> 
						             <a href="<%=path %>/xinwenDetailQian.action?id=${xinwen.id}">${xinwen.biaoti}</a>
						       </div>
						      <div class="f-right" style="margin-top: 15px;">${xinwen.shijian}</div>
						      <div class="clear"></div>
						  </div>
						</c:forEach>
						<br/><br/>
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
