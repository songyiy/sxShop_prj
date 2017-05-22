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
        function orderDel(id)
        {
            var url="<%=path %>/orderDel.action?id="+id;
            window.location.href=url;
        }
        
        function orderDetail(id)
        {
                 var url="<%=path %>/orderDetail.action?orderId="+id;
                 var ret = window.showModalDialog(url,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
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
						<c:forEach items="${requestScope.orderList}" var="order">
						               <fieldset style="width:95%; margin-left:5px;"><legend class="fieldtitle"></legend>
											<table class="bill" width="97%" cellpadding="11" cellspacing="11">
											    <tr>
											        <td>订单编号：${order.bianhao}</td>
											    </tr>
											    <tr>
											        <td>下单时间：${order.xiadanshi}</td>
											    </tr>
											    <tr>
											        <td>收货人姓名：${order.userRealname}</td>
											    </tr>
											    <tr>
											        <td>联系电话：${order.userTel}</td>
											    </tr>
											    <tr>
											        <td>送货地址：${order.songhuodizhi}</td>
											    </tr>
											    <tr>
											        <td>付款方式：${order.fukuanfangshi}</td>
											    </tr>
											    <tr>
											        <td>订单金额：${order.jine}</td>
											    </tr>
											    <tr>
											        <td>订单状态：${order.zhuangtai}</td>
											    </tr>
											    <tr>
											        <td>
											           <a href="#" onclick="orderDetail(${order.id})"/>订单明细</a>
											           &nbsp;&nbsp;
											           <a href="#" onclick="orderDel(${order.id})">删除</a>
											        </td>
											    </tr>
											</table>
									   </fieldset>
									   <br/>
									   </c:forEach>
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
