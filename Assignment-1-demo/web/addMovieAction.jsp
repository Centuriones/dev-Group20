<%-- 
    Document   : addmovieaction.jsp
    Created on : 30/05/2019, 8:30:30 PM
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
        <title>Adding Movie...</title>
    </head>
    <body>

        <div>
            <div>
                <br>
                <h2>Add Movie</h2>
                <%
                    MovieDb manager = (MovieDb)session.getAttribute("manager"); 
                    String title = request.getParameter("title");
                    String genre = request.getParameter("genre");
                    String description = request.getParameter("description");
                    Double rating = Double.parseDouble(request.getParameter("rating"));
                    String releaseDate = "2010-10-20 12:00:00";
                    String coverArtPath = "assets/images/movies/";
                    String coverArt = request.getParameter("coverart");
                    Double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));

                    if (!manager.movieExists(title)) {
                        manager.addMovie(title, genre, description, rating, releaseDate, coverArtPath + coverArt, price, quantity);
                        /*
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
                        }*/
                        %>
                        <h4>Movie added successfully.</h4>
                            <a href="addMovie.jsp">Add Another Movie</a><br>
                            <a href="movieView.jsp">Back to View</a>
                        <% } else { %>
                        <h4>Movie already exists, choose a different Movie title name.</h4>
                            <a href="addMovie.jsp">Try Again</a><br>
                            <a href="movieView.jsp">Back to Movie View</a>
                        <%
                    }      
                %>
            </div>
        </div>
    </body>
</html>
