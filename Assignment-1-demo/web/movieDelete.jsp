<%-- 
    Document   : movieDelete
    Created on : 30/05/2019, 9:24:44 PM
    Author     : LTChr
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Movie</title>
    </head>    
    <body>
        <div>
            <div>
                <br>
                <h2>Delete Movie</h2>
                <%
                String deleted = request.getParameter("delete");
                int movieID = Integer.parseInt(request.getParameter("s"));
                session.setAttribute("deleteId", movieID);
                MovieDb manager = (MovieDb)session.getAttribute("manager");
                Movie currentMovie = manager.searchMovie(movieID);

                if (deleted == null) {
                %>
                <form action="deleteMovieAction.jsp" method="POST">
                    <table>
                        <tr>
                            <td colspan="2" style="text-align: center"><img src="<%=currentMovie.getCoverArt()%>" alt="<%=currentMovie.getCoverArt()%>" width="150">
                        </tr>
                        <tr>
                            <td>Title</td>
                            <td><input type="text" name="title" style="width: 100%" value="<%=currentMovie.getTitle()%>"></td>
                        </tr>
                        <tr>
                            <td>Genre</td>
                            <td><input type="text" name="genre" style="width: 100%" value="<%=currentMovie.getGenre()%>"></td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td><textarea name="description" rows="5" cols="40"><%=currentMovie.getDescription()%></textarea></td>
                        </tr>
                        <tr>
                            <td>Rating</td>
                            <td><input type="text" name="rating" style="width: 100%" value="<%=currentMovie.getRating()%>/10"></td>
                        </tr>
                        <tr>
                            <td>Release Date</td>
                            <td><input type="text" name="releasedate" style="width: 100%" value="<%=currentMovie.getFormattedDate()%>"></td>
                        </tr>  
                        <tr>
                            <td>Price</td>
                            <td><input type="text" name="price" style="width: 100%" value="<%=currentMovie.getFormattedPrice()%>"></td>
                        </tr>
                        <tr>
                            <td>Quantity</td>
                            <td><input type="number" name="quantity" style="width: 100%" value="1"></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td><br>
                                <table>
                                    <tr>
                                        <td><input type="submit" name="delete" value="Confirm Delete"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </form>                    
                <br><a href="movieView.jsp">Back to Movie View</a>
                <% }
                else {
                        manager.deleteMovie(movieID);
                        %>
                        <h3 class="mb-4"><%=currentMovie.getTitle()%> deleted successfully.</h3>
                        <a href="movieView.jsp">Back to Movie View</a>
                        <%
                    }
                %>
            </div>
        </div>
    </body>
</html>