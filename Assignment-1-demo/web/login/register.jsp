<%-- 
    Document   : register
    Created on : 2019-4-2, 12:31:57
    Author     : CZC
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    
    <body>
        <div><h1>Register</h1></div>
        <form action="registerAction.jsp" method="POST">
            <table width="50%">
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td>First name</td>
                    <td><input type="text" name="firstName"></td>
                </tr>
                <tr>
                    <td>Last name</td>
                    <td><input type="text" name="lastName"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"></td> 
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td><input type="text" name="phone"></td>
                </tr>
                <tr>
                    <td><label for="att">Agree to private policy</label></td>
                    <td><input type="checkbox" name="tos" id="att"></td>
                </tr>
                <tr><td colspan="2" align="center"><input type="submit" value="Register"></td></tr>
                <tr><td colspan="2" align="center"><input type="button" value="Cancel" onclick="history.back()"></td></tr>
            </table>   
        </form>
    </body>
</html>