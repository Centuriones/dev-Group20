<%-- 
    Document   : loginAction
    Created on : 2019-4-16, 14:54:40
    Author     : CZC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Login successful. Click <a href="index.jsp">here</a> to return to the main page.</p>
        <p>Password incorrect. Click <a href="index.jsp">here</a> to try again.</p>
        <%-- 
            <%
                String ID = request.getParameter("ID");
                Users users = new Users();
                User user = users.login(ID);
                if(user != null) {
                    session.setAttribute("user", user);
                    response.sendRedirect("main.jsp");
                } else {
                    session.setAttribute("error", "user does not exist!");
                    response.sendRedirect("login.jsp");
                }
            %>
        --%>
    </body>
</html>
