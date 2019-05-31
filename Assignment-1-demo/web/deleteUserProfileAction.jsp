<%-- 
    Document   : deleteUserProfileAction
    Created on : 31/05/2019, 7:57:10 PM
    Author     : LTChr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>

<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        UserDb userDb = (UserDb) session.getAttribute("userDb");
        userDb.deleteUser(user.getEmail());
    }
    session.invalidate();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Delete</title>
    </head>
    <body>
        <div>
            <div>
                Your account has been deleted. Please return to the <a href="index.jsp">Home Page</a>.
            </div>
        </div>
    </body>
</html>