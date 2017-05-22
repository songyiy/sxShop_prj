<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

    <script type="text/javascript">
            function myXinxi()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                var url="<%=path %>/qiantai/userinfo/userXinxi.jsp";
	                var n="";
	                var w="480px";
	                var h="500px";
	                var s="resizable:no;help:no;status:no;scroll:yes";
				    openWin(url,n,w,h,s);
	            </s:else>
	        }
	        function myCart()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                 var s="<%=path %>/myCart.action";
	                 window.location.href=s;
	            </s:else>
	        }
	        
	        function myOrder()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                 var s="<%=path %>/myOrder.action";
	                 window.location.href=s;
	            </s:else>
	        }
	        
	        function liuyanAll()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                 var url="<%=path %>/liuyanAll.action";
				     window.open(url,"_blank");
	            </s:else>
	        }
        
    </script>
    
  </head>
  
  <body>
        <div id="top">
			<table>
			   <tr><td><p style="margin-top: 40px;font-family: 微软雅黑;font-size: 27px;color: white;margin-bottom: 10px;margin-left: 100px;">
			     铭贤农贸商场</p>
			     </td></tr>
			</table>
			<div id="top-navigation">
				<!-- <a href="#" style="font-family: 微软雅黑;font-size: 14px;">注册</a>
				<span>|</span>
				<a href="#" style="font-family: 微软雅黑;font-size: 14px;">登陆</a> -->
			</div>
		</div>
		
		<div id="navigation" style="margin-top: 40px;">
			<ul style="margin-left: 20px;">
			    <li><a href="<%=path %>/qiantai/default.jsp" style="font-family: 微软雅黑;font-size: 14px;"><span>系统首页</span></a></li>
			    <li><a href="<%=path %>/xinwenAll.action" style="font-family: 微软雅黑;font-size: 14px;"><span>新闻资讯</span></a></li>
			    <li><a href="<%=path %>/liuyanAll.action" style="font-family: 微软雅黑;font-size: 14px;"><span>系统留言板</span></a></li>
			   
			    <c:if test="${sessionScope.user==null }">
			    <li><a href="<%=path %>/qiantai/userinfo/userReg.jsp" style="font-family: 微软雅黑;font-size: 14px;"><span>注册用户</span></a></li>
			    <li><a href="<%=path %>/qiantai/userinfo/userLogin.jsp" style="font-family: 微软雅黑;font-size: 14px;"><span>用户登陆</span></a></li>
			    </c:if>
			    <c:if test="${sessionScope.user!=null }">
			    <li><a href="#" style="font-family: 微软雅黑;font-size: 14px;"><span>欢迎你：${sessionScope.user.userName }</span></a></li>
			    <li><a href="<%=path %>/userLogout.action" style="font-family: 微软雅黑;font-size: 14px;"><span>注销退出</span></a></li>
			    
			    <li><a href="#" onClick="myCart()" style="font-family: 微软雅黑;font-size: 14px;"><span>购物车</span></a></li>
			    <li><a href="#" onClick="myOrder()" style="font-family: 微软雅黑;font-size: 14px;"><span>我的订单</span></a></li>
			    
			    </c:if>
			</ul>
		</div>
  </body>
</html>
