<%-- 
    Document   : viewUserProfile
    Created on : 30/05/2019, 7:20:35 PM
    Author     : LTChr
--%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Boolean isnull = true;
    //if(session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
    //    isnull = false;
    //}
    String errorMessage = (String) session.getAttribute("errorMessage");
    String successMessage = (String) session.getAttribute("successMessage");
    //System.out.println(user);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View User Profile</title>
    </head>
    <body>     
        <% if (user == null) { %>
            You must be logged in to view this page. Please <a href="login.jsp">Sign In</a> to continue.
        <% } else { %>
            <h2>${user.getFirstName()} ${user.getLastName()}</h2>
        <h4>My Details</h4>
        <table>
            <tr>
                <td>First Name</td>
                <th>${user.firstName}</th>
            </tr>
            <tr>
                <td>Last Name</td>
                <th>${user.lastName}</th>
            </tr>
            <tr>
                <td>Email Address</td>
                <th>${user.email}</th>
            </tr>
            <tr>
                <td>Phone Number</td>
                <th>${user.phone}</th>
            </tr>
            
        </table>
        <div>
            <h5>Edit Account</h5>
            <div>
                <a href="deleteUserProfileAction.jsp" >Delete Account </a>||<a href="profileEditor.jsp"> Update Account</a>
            </div>
            <div>
                Return to <a href="index.jsp">Home</a>
            </div>
        </div>
        <% } %>
    </body>
</html>
<%
    session.removeAttribute("errorMessage");
    session.removeAttribute("successMessage");
%>
