<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: arail
  Date: 10/20/2020
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirmation Page</title>
    <style>
        body{
            background-image: url("mainback.jpg");
        }
       .blank{
           background-color: white;
           width: 50%;
           padding: 30px;
           text-align: center;
           margin-left: 25%;
           margin-top: 8%;
       }
    </style>
</head>
<body>
<div class="blank">
<h1>Please, confirm your purchases!</h1>
<h2>You are going to buy:</h2>
<%
    ArrayList<String> productList=(ArrayList<String>)request.getSession().getAttribute("card");
    PrintWriter print = response.getWriter();
    if(productList!=null){
      for(String product:productList){
%>
    <p><%=product%></p>
    <p>Sorry! You can buy only one product</p>

<%
        }
    session.setAttribute("card", new ArrayList<String>());
    }

    Date date=new Date(request.getSession().getCreationTime());
    Date last=new Date(request.getSession().getLastAccessedTime());
    int count=0;
    if(session.getAttribute("count")!=null){
        count=(int)session.getAttribute("count");
    }
%>
<p>Session creation time: <%=date%></p>
<p>Last activity time: <%=last%></p>
<p>Number of visits:<%=count%></p>
<form method="post" action="index.jsp">
   <input type="submit" value="CONFIRM">
</form>
</div>
</body>
</html>
