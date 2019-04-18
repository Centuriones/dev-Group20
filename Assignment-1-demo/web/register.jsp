<%-- 
    Document   : register
    Created on : 2019-4-2, 12:31:57
    Author     : CZC
--%>

<%@page import="uts.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    
    <body>
        <div> <h1>Register</h1></div>
       
        <form action="welcome.jsp" method="POST">
            <table width="50%">
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email"></td>
                </tr>
                
                <tr>
                    <td>Full name</td>
                    <td><input type="text" name="name"></td>
                </tr>
                
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"></td> 
                </tr>
                
                <tr>
                    <td rowspan="2">Gender</td>
                    <td><input type="radio" name="gender" value="Male">Male </td>
                <tr><td><input type="radio" name="gender" value="Female">Female </td></tr>
                <tr>
                    <td><label for="att">Agree to private policy</label></td>
                    <td><input type="checkbox" name="tos" id="att"></td>
                </tr>
                <tr><td colspan="2" align="center"><input type="submit" value="Register"></td></tr>
            </table>   
        </form>
    </body>
</html>