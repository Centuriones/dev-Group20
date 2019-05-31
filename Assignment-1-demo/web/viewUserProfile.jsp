<%-- 
    Document   : viewUserProfile
    Created on : 30/05/2019, 7:20:35 PM
    Author     : LTChr
--%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/ConnServlet" flush="true" />

<%
    User user = (User) session.getAttribute("user");
    String errorMessage = (String) session.getAttribute("errorMessage");
    String successMessage = (String) session.getAttribute("successMessage");
    System.out.println(user);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Movie Store</title>
    </head>
    <body>     
                <% if (user == null) { %>
                
                    You must be logged in to view this page. Please <a href="login/login.jsp">Sign In</a> to continue.
                
                <% } else { %>

                    <h2>${user.getFirstName()} ${user.getLastName()}</h2>

                <%--<h4>My Details <a href="${pageContext.request.contextPath}/editProfile.jsp">Edit Account</a></h4>--%>
                <table>
                    <tr>
                        <td>First Name</td>
                        <%--<th>${user.firstName}</th>--%>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <%--<th>${user.lastName}</th>--%>
                    </tr>
                    <tr>
                        <td>Email Address</td>
                        <%--<th>${user.email}</th>--%>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <%--<th>${user.phoneNumber}</th>--%>
                    </tr>
                </table>

                <div>
                    <h5>Delete Account</h5>
                    <div>
                        <h5>Are you Sure?</h5>
                        <p>Once your account has been deleted, it cannot be recovered. Proceed with Caution!</p>
                        <%--<a href="${pageContext.request.contextPath}/doDeleteProfile.jsp">Delete My Account</a>--%>
                    </div>
                </div>
                <% } %>
    </body>
</html>
<%
    session.removeAttribute("errorMessage");
    session.removeAttribute("successMessage");
%>
