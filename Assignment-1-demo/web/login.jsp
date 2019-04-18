<%-- 
    Document   : test
    Created on : May 8, 2018, 12:03:36 PM
    Author     : Dalley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h1>Login</h1>
            <h4>Welcome to our Movie Store</h4>
            <p >Please enter your details below</p><br/>

            <!-- Login Form -->
            <form method="POST" action="loginAction.jsp">
                <table>
                    <tr>
                        <td>
                            <div>
                                <label for="email">E-Mail Address</label>
                                <input id="email" type="email" name="email" value="">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div >
                                <label for="password">Password</label>
                                <input id="password" type="password"  name="password" >
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <center><div>
                                <input type="submit" value="login">
                            </div></center>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                Don't have an account already? <a href="register.jsp" class="text-muted font-weight-light" data-toggle="">Create One</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </center>
</body>
</html>
