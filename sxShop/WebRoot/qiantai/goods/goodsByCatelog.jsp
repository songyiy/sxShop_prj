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
		function goodsDetailQian(goodsId)
        {
            var url="<%=path %>/goodsDetailQian.action?goodsId="+goodsId;
            window.location.href=url;
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
						<TABLE class=main border=0 cellSpacing=0 cellPadding=0>
			               <TR>
			                  <c:forEach items="${requestScope.goodsList}" var="goods" varStatus="sta">
			                    <c:if test="${sta.index%4==0}">
			                       </tr><tr>
			                    </c:if>
				                <TD>
				                  <TABLE onmouseover="this.style.backgroundColor='#FF6600'" onmouseout="this.style.backgroundColor=''" border=0 cellSpacing=1 cellPadding=2 width=98 bgColor=#e1e1e1 align=center height=100>
				                    <TR>
				                      <TD bgColor=#ffffff height=100 width=120 align=left>
				                        <P align="center">
				                           <A href="<%=path %>/goodsDetailQian.action?goodsId=${goods.goodsId}"><IMG border=0 align=absMiddle src="<%=path %>/${goods.goodsPic}" width=150 height=180></A>
				                           <A href="<%=path %>/goodsDetailQian.action?goodsId=${goods.goodsId}"><FONT color=#ff0000>${goods.goodsName}</FONT></A><BR>&nbsp;价格：${goods.goodsShichangjia}元
				                        </P>
				                      </TD>
				                    </TR>
				                  </TABLE>
				                </TD>
			                  </c:forEach>
			               </TR>
		                </TABLE>
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
