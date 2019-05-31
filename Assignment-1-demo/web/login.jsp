<%-- 
    Document   : test
    Created on : May 8, 2018, 12:03:36 PM
    Author     : Dalley
--%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    String successMessage = (String) session.getAttribute("successMessage");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Login Page</title>
    </head> 
    <body >
        
    <center>
        <div>
            <% if (user == null) { %>
            <h1>Login</h1>
            <h4>Welcome to our Movie Store</h4>
            <p >Please enter your details below</p>
            <%
                if(session.getAttribute("error") == "No user"){
                    session.setAttribute("error", "");
            %>
            <p style="color:red;">Incorrect email or password.</p>
            <%} else if(successMessage != null){%>
            <p style="color:green;">${successMessage}</p>
            <%} else {%>
                <br/><br/>
            <%}%>

            <!-- Login Form -->
            <form method="POST" action="loginAction.jsp">
                <table>
                    <tr>
                        <td align="right">
                            <div>
                                <label for="email">E-Mail Address: </label>
                            </div>
                        </td>
                        <td align="left">
                            <div>
                                <input id="email" type="email" name="email" value="">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <div>
                                <label for="password">Password:</label>
                            </div>
                        </td>
                        <td align="left">
                            <div>
                                <input id="password" type="password"  name="password" >
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <center><div>
                                <input type="submit" value="Login">
                            </div></center>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <div>
                                Don't have an account already? <a href="register.jsp" class="text-muted font-weight-light" data-toggle="">Create One</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <div>
                                Return to <a href="index.jsp" class="text-muted font-weight-light" data-toggle="">Home</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
            <% } else { %>
                You must log out before you can login to another account. Please <a href="logoutAction.jsp">Logout</a> to continue.
            <% } %>
        </div>
    </center>
</body>
<%
    session.removeAttribute("errorMessage");
    session.removeAttribute("successMessage");
%>
</html>
