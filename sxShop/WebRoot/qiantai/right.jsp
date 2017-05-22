<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

  </head>
  
  <body>
            <div id="sidebar">
				<div class="box">
					<div class="box-head">
						<h2 style="font-family: 微软雅黑">友情链接</h2>
					</div>
					<div class="box-content">
						<p><a href="http://www.baidu.com">百度网站</a></p>
						<p><a href="http://www.google.com.hk">谷歌网站</a></p>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="box">
					<div class="box-head">
						<h2 style="font-family: 微软雅黑">商品类别</h2>
					</div>
					<div class="box-content">
						<s:action name="catelogAll" executeResult="true" flush="true"></s:action>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="box">
					<div class="box-head">
						<h2 style="font-family: 微软雅黑">网站日历</h2>
					</div>
					<div class="box-content">
						<jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include> 
					</div>
				</div>
			</div>
			<!-- <div id="sidebar">
				<div class="box">
					<div class="box-head">
						<h2 style="font-family: 微软雅黑">联系我们</h2>
					</div>
					<div class="box-content">
						<p>地址：北京市环海大厦1602</p>
						<p>电话：13555555555</p>
						<p>传真：010-4567892</p>
					</div>
				</div>
			</div> -->
  </body>
</html>
