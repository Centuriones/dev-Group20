<%-- 
    Document   : addmovieaction.jsp
    Created on : 17/05/2019, 5:31:40 PM
    Author     : andrew
--%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.*" %>

<%@page import="uts.isd.model.*"%>
<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%@ include file="/WEB-INF/jspf/header.jspf" %>

        <div class="main" role="main">
            <div class="container">
                <br>
                <h2 class="mb-4">Add Movie</h2>
                <%
                    DBManager manager = (DBManager)session.getAttribute("manager"); 
                    String title = request.getParameter("title");
                    String genre = request.getParameter("genre");
                    String description = request.getParameter("description");
                    String coverArtPath = "assets/images/movies/";
                    String coverArt = request.getParameter("coverart");
                    Double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));

                    if (!manager.movieExists(title)) {
                        manager.addMovie(title, genre, description, coverArtPath + coverArt, price, quantity);
                        
                        File file;
                        int maxFileSize = 5000 * 1024;
                        int maxMemSize = 5000 * 1024;
                        String filePath = "http://localhost:8080/OnlineMovieStore"; 
                        String contentType = request.getContentType();
                        if ((contentType.indexOf("multipart/form-data") >= 0)) {
                            DiskFileItemFactory factory = new DiskFileItemFactory();
                            factory.setSizeThreshold(maxMemSize);
                            factory.setRepository(new File("Desktop\\a.png"));
                            ServletFileUpload upload = new ServletFileUpload(factory);
                            upload.setSizeMax(maxFileSize);
                            try { 
                                List fileItems = upload.parseRequest(request);
                                Iterator i = fileItems.iterator();
                                while (i.hasNext()) {
                                    FileItem fi = (FileItem)i.next();
                                    if (!fi.isFormField ()) {
                                        String fieldName = fi.getFieldName();
                                        String fileName = fi.getName();
                                        boolean isInMemory = fi.isInMemory();
                                        long sizeInBytes = fi.getSize();
                                        file = new File(filePath + "/" + coverArtPath + "/" + coverArt) ;
                                        fi.write(file) ;
                                        out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                                    }
                                }
                            }
                            catch(Exception ex) {
                                System.out.println(ex);
                            }
                        }
                        %>
                        <h4 class="mb-4"><%=title%> added successfully.</h3>
                            <a href="addmovie.jsp">Add Another Movie</a><br>
                            <a href="moviemanagement.jsp">Back to Movie Management</a>
                        <%
                    }
                    else {                            %>
                        <h4 class="mb-4"><%=title%> already exists, choose a different Movie title name.</h3>
                            <a href="addmovie.jsp">Try Again</a><br>
                            <a href="moviemanagement.jsp">Back to Movie Management</a>
                        <%
                    }      
                %>
                
                
            </div>
        </div>
    </body>
</html>
