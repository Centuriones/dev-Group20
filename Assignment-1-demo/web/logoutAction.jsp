<%-- 
    Document   : logoutAction
    Created on : 30/05/2019, 6:21:26 PM
    Author     : LTChr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging Out...</title>
    </head>
    <body>
        <%
            Date date = new Date();
            Long time = date.getTime();
            Timestamp logouttime = new Timestamp(time);
            LoginsessionClass loginsession = (LoginsessionClass)session.getAttribute("loginsessionClass");
            String loginid = loginsession.getLoginid();
            LoginsessionDb loginDb = (LoginsessionDb)session.getAttribute("loginDb");
            loginDb.addLogouttime(loginid, logouttime);
            session.invalidate();
            response.sendRedirect("index.jsp");                                   
        %>
    </body>
</html>