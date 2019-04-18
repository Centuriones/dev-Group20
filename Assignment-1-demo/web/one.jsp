<%-- 
    Document   : one
    Created on : 2019-4-9, 13:18:17
    Author     : CZC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
        String submitted = request.getParameter("yes");
        %>
    </head>
    
    <body>
        <div> <h1>Register</h1></div>
       <% 
        if(submitted != null && submitted.equals("yes")){%>
        <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome page</title>
    </head>
    <%
        String name;
        String password;
        String email;
        String gender;
        String favmo;
        
        %>
        
        <%
            name=request.getParameter("name");
            password=request.getParameter("password");
            email=request.getParameter("email");
            gender=request.getParameter("gender");
            favmo=request.getParameter("favmo");
            String tos=request.getParameter("tos");
            
            %>
    <body>
        <%if(tos!=null){%>
        <h1>Welcome, <%=name%></h1>
        <p>Your email is <%=email%></p>
        <p>Your password is <%= password%></p>
        
        <p>Your gender is <%= gender%></p>
        <p>Your favourite colour is <%= favmo%></p>
        <%}else{%>
        <p>Sorry,you must agree to the Terms of Service.</p>
        <p>click<a href="register.jsp">here</a>to go back.</p>
        <%}%>
    </body>

         <%}else{%>
        <form action="one.jsp" target="_blank" method="POST">
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
                </tr>
                
                <tr>
                    <td>Favourite type of movie</td>
                    <td>
                        <select name="favmo">
                            <option selected>SF</option>
                            <option>Classic</option>
                            <option>War</option>
                            <option>Super hero</option>
                            <option>History</option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td><label for="att">Agree to private policy</label></td>
                    <td><input type="checkbox" name="tos" id="att"></td>
                </tr>
                
                <tr><td colspan="2" align="center"><input type="submit" value="Register" name="subbmitted"></td></tr>
                
                
            </table>
            
         <form action="welcome.jsp"><input type="hidden" name="submitted" value="yes"> </form>  
        </form>
        
       
       
        <%}%>
    </body>
</html>