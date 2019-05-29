<%-- 
    Document   : register
    Created on : 2019-4-2, 12:31:57
    Author     : CZC
--%>

<%--<%@page import="uts.*"%> --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    
    <body onload="startTime()">
        <div><span class="time" id="time" ></span></div>
        <h1>Enter your details to register:</h1> 
        <br>
        <form action="welcome.jsp" method="post">
            <table>
                <tr><td>Name:</td><td><input size="23" type="text" name="name"></td></tr>
                <tr><td>Email:</td><td><input size="23" type="text" name="email"></td></tr>
                <tr><td>Password:</td><td><input size="23" type="password" name="password"></td></tr>
                <tr><td>Date of Birth:</td><td><input type="date" name="dob"></td></tr>
                <tr><td>Contact Number:</td><td><input type="text" name="number"></td></tr>
                <tr><td>Time:</td><td><input type="startTime()"></td></tr>
                <tr><td></td>
                    <td>
                        <input class="button" type="submit" value="Register"> 
                        &nbsp; 
                        <button class="button" type="button" onclick="location.href = 'index.jsp'" > Home Page </button>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>