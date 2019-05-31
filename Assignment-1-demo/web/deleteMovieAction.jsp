<%-- 
    Document   : deleteMovieAction
    Created on : 31/05/2019, 11:32:24 PM
    Author     : LTChr
--%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%@page import="uts.wsd.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting Movie...</title>
    </head>
    <body>

        <div>
            <div>
                <br>
                <h2>Deleting Movie</h2>
                <%
                    MovieDb manager = (MovieDb)session.getAttribute("manager");
                    //int movieID = Integer.parseInt(request.getParameter("deleteId"));
                    manager.deleteMovie(1);  
                %>
                <h4>Movie deleted successfully.</h4>
                    <a href="movieView.jsp">Back to View</a>
            </div>
        </div>
    </body>
</html>
