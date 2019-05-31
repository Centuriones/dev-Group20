<%-- 
    Document   : loginAction
    Created on : 2019-4-16, 14:54:40
    Author     : CZC
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
            Date date = new Date();
            Long time = date.getTime();
            Timestamp logintime = new Timestamp(time);
            int key = (new Random()).nextInt(999999);
            String loginid = "" + key;
            UserDb userDb = (UserDb) session.getAttribute("userDb");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = userDb.getUser(email, password);
            if (user != null) {
                LoginsessionClass loginsession = new LoginsessionClass(loginid, logintime, email);
                session.setAttribute("loginsession", loginsession);
                session.setAttribute("user", user);
                LoginsessionDb loginDb = (LoginsessionDb)session.getAttribute("loginDb");
                loginDb.addLogintime(loginid, logintime, email);
                response.sendRedirect("../index.jsp");                        
            } else {
                session.setAttribute("error", "No user");
                response.sendRedirect("login.jsp");                               
            }             
        %>
        <p>Redirecting...</p>
    </body>
</html>
