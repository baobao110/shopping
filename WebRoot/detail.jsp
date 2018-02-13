<%@page import="A.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'detail.jsp' starting page</title>
    
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
   <%
   GOODS good=Instance.GETGoods(Integer.parseInt(request.getParameter("id")));
   if(good!=null)
   	{
    %>
       <div>
             <dl>
               <dt>
               <img src="images/<%=good.getPicture()%>" width="120" height="90" border="1"/></a>
               </dt>
               <dd>
              	 品牌:<%=good.getName() %>         
              </dd>
               <dd>
             	价格:<%=good.getPrice() %>
               </dd>
                <dd>
             	国家:<%=good.getCuntry() %>
               </dd>
             </dl>
          </div>
         <%
         	}
          %>
          <%
          String a="";
         Cookie[] b=request.getCookies();
         for(Cookie i:b){
    		if(i.getName().equals("view")){
    			a=i.getValue();
    			}
    		}
         a+=request.getParameter("id")+",";
         Cookie d=new Cookie("view",a);
         response.addCookie(d);
           %>
        <td width="30%" bgcolor="#EEE" align="center">
             <br>
             <b>您浏览过的商品</b><br>
        <%
        	ArrayList<GOODS> z=Instance.history(a);
        	for(GOODS j:z)
        	{
         %>
          <div>
             <dl>
               <dt>
            <a href="details.jsp?id=<%=j.getId()%>"> <img src="images/<%=j.getPicture()%>" width="120" height="90" border="1"/></a>
               </dt>
               <dd>
              	 品牌:<%=j.getName() %>         
              </dd>
               <dd>
             	价格:<%=j.getPrice() %>
               </dd>
                <dd>
             	国家:<%=j.getCuntry() %>
               </dd>
             </dl>
          </div>
         <%
           }
           %>
  </body>
</html>
