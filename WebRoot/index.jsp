<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="A.*" %>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	   div{
	      float:left;
	      margin: 10px;
	   }
	   div dd{
	      margin:0px;
	      font-size:10pt;
	      }
	</style>
  </head>
  
  <body>
    <h1>商品展示</h1>
    <hr>
  
    <center>
    <table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
      <tr>
        <td>
        <%
        	ArrayList<GOODS> a=Instance.SetGoods();
        	if(a!=null&&a.size()>0){
                        for(GOODS i:a ){
                        	
        %>
           <div>
             <dl>
               <dt>
               <a href="detail.jsp?id=<%=i.getId()%>"><img src="images/<%=i.getPicture()%>" width="120" height="90" border="1"/></a>
               </dt>
               <dd>
              	 品牌:<%=i.getName() %>        
             	</dd>
               <dd> 
             	价格:<%=i.getPrice() %>
               </dd>
               <dd> 
             	国家:<%=i.getCuntry() %>
               </dd>
             </dl>
          </div>
          <%
          }
      }
           %>
  </body>
</html>
