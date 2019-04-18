<%-- 
    Document   : login
    Created on : 09/04/2019, 12:44:49 PM
    Author     : Lachlan
--%>

<%@page import="uts.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="index.jsp" method="POST">
            <table width="50%">
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email"></td>
                </tr>
                
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"></td> 
                </tr>
                <tr><td colspan="2" align="center"><input type="submit" value="Login"></td></tr>
            </table>   
        </form>
    </body>
</html>
