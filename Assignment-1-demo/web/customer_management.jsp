<%-- 
    Document   : index
    Created on : 06/05/2019, 2:57:16 PM
    Author     : andrew
--%>

<%@page import="uts.wsd.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("user");
  
%>
<!DOCTYPE html>
<html lang="en">
    <head>
      
    </head>
    
    <body>
        
          <div class="main" role="main">
            <div class="container">
                <br>
                <h2 class="mb-4">Customer Information Management</h2>
                <form action="" method="get">
                <table>
                    <tr>
                        <td><input type="text" name="searchcustomer" placeholder="Search"></td>
                        <td>
                            <input list="searchuser" name="searchuser" placeholder="Search Customer">
                            <datalist id="searchuser">
                            <option value="email">
                            <option value="firstname">
                            <option value="lastname">
                            <option value="phone">
                          
                            </datalist>
                        </td>
                        <td>                    
                            <input type="submit" name="search" value="Search" class="btn btn-primary">
                            <input type="submit" name="reset" value="Reset" class="btn btn-primary">
                        </td>
                </table>
                      


                </form>

                <br>
                <%    
                UserDb admin = (UserDb)session.getAttribute("admin");
                String email = request.getParameter("email");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String phone = request.getParameter("phone");
                String reset = request.getParameter("reset");
                User[] customerSearch;
               
                if (reset == null) 
                    customerSearch = admin.getUser(email, firstName,lastName,phone);
                else 
                    customerSearch = admin.getUser(null, null,null,null);
                %>    
                <table style="width:100%" border="1px solid black">
                    <thead>
                        <tr>
                            <th text-align: center>Email</th>
                            <th text-align: center>First Name</th>
                            <th text-align: center>Last Name</th>
                            <th text-align: center>Phone Number</th>
                        
                        </tr>
                    </thead>
                <%
                    for (int x = 0; x <= customerSearch.length - 1; x ++) {
                        %>
                        <tr>
                            <td style="text-align: center"><%=customerSearch[x].getEmail()%></td>
                            <td style="text-align: center"><%=customerSearch[x].getFirstName()%></td>
       
                            <td style="text-align: center"><%=customerSearch[x].getLastName()%>/10</td>
                            <td style="text-align: center"><%=customerSearch[x].getPhone()%></td>
                            
                            <td style="text-align: center"><a href="account_edit.jsp?id=<%=customerSearch[x].getEmail()%>"><img src="${pageContext.request.contextPath}/assets/images/icons/icons8-edit-32.png" alt="Edit"></a><a href="deleteAccount.jsp?id=<%=customerSearch[x].getEmail()%>"><img src="${pageContext.request.contextPath}/assets/images/icons/icons8-delete-32.png" alt="Delete"></a></td>
                        </tr>                            
                        <%
                    }
                %>
                </table>
                <br>
                <p class="card-text"><a class="btn btn-primary" href="createNewAccount.jsp" role="button">Add New Customer</a></p><br>
            </div>
        </div>

        <%@ include file="/WEB-INF/jspf/footer.jspf" %>

      
    </body>
</html>