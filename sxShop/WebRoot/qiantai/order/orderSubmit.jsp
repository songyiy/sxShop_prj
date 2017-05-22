<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
						<table width="99%" border="0" cellpadding="9" cellspacing="9" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
				              <tr>
				                  <td align="center" style="color: red">恭喜您，订单提交成功！</td>
				              </tr>
				              <tr>
				                  <td>订单编号：${requestScope.order.bianhao }</td>
				              </tr>
				              <tr>
				                  <td>下单日期：${requestScope.order.xiadanshi }</td>
				              </tr>
				              <tr>
				                  <td>收货人姓名：${requestScope.order.userRealname }</td>
				              </tr>
				              <tr>
				                  <td>联系电话：${requestScope.order.userTel }</td>
				              </tr>
				              <tr>
				                  <td>送货地址：${requestScope.order.songhuodizhi }</td>
				              </tr>
				              <tr>
				                  <td>付款方式：${requestScope.order.fukuanfangshi }</td>
				              </tr>
				              <tr>
				                  <td>总金额：${requestScope.order.jine }</td>
				              </tr>
				              <tr>
				                  <td>订单状态：${requestScope.order.zhuangtai }</td>
				              </tr>
		        		</table>
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
