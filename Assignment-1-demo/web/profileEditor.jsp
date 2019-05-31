<%-- 
    Document   : profileEditor
    Created on : 31/05/2019, 7:42:01 PM
    Author     : LTChr
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/ConnServlet" flush="true" />

<%
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Profile Editor</title>
</head>

<body>
    <div>
        <div>
            <div>
                <h2>Edit Your Account</h2>
            </div>

            <form action="doProfileUpdate.jsp" method="post">
                <table class="table">
                    <tr>
                        <td>Email</td>
                        <td><input value="${user.email}" name="email" type="text"></td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td><input value="${user.firstName}" name="firstname" type="text"></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input value="${user.lastName}" name="lastname" type="text"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input value="${user.password}" name="password" type="password"></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><input value="${user.phone}" name="phone" type="text"></td>
                    </tr>
                </table>
                <div>
                    <div>
                        <input type="submit" value="Update Account">
                        <a href="viewUserProfile.jsp">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>