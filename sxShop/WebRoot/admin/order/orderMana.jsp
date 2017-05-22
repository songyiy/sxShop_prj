<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
        <script language="javascript">
           function orderDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/orderDelByAd.action?id="+id;
               }
           }
           
           function orderShouli(id)
           {
               if(confirm('您确定受理订单吗？'))
               {
                   window.location.href="<%=path %>/orderShouli.action?id="+id;
               }
           }
           
           
           function orderDetail(orderId)
           {
                 var url="<%=path %>/orderDetail.action?orderId="+orderId;
                 var ret = window.showModalDialog(url,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
           }
           
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="17" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="10%">订单编号</td>
					<td width="10%">下单日期</td>
					<td width="10%">收货人姓名</td>
					
					<td width="10%">联系电话</td>
					<td width="10%">送货地址</td>
					<td width="10%">付款方式</td>
					<td width="10%">金额</td>
					
					<td width="10%">状态</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.orderList}" var="order" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
					    ${ss.index+1 }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${order.bianhao }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${order.xiadanshi }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${order.userRealname }
					</td>
					
					
					<td bgcolor="#FFFFFF" align="center">
					   ${order.userTel }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${order.songhuodizhi }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${order.fukuanfangshi }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${order.jine }
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
					   ${order.zhuangtai }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除订单" onclick="orderDel(${order.id })"/>
						<input type="button" value="订单明细" onclick="orderDetail(${order.id })"/>
						<input type="button" value="受理订单" onclick="orderShouli(${order.id })"/>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>