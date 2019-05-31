<%-- 
    Document   : addMovie
    Created on : 30/05/2019, 7:25:30 PM
    Author     : LTChr
--%>

<%@page import="uts.wsd.*"%>

<%
    User user = (User) session.getAttribute("user");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Movie</title>
    </head>
    <body>
        <div>
            <div>
                <br>
                <h2>Add Movie</h2>
                <%
                    String submitted = request.getParameter("submit");
                    if (submitted == null) {
                %>
                <form action="addMovieAction.jsp" method="POST">
                    <table>
                        <tr>
                            <td>Title</td>
                            <td><input type="text" name="title" maxlength="30" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <td>Genre</td>
                            <td>
                                <select name="genre" style="width: 100%">
                                    <option value="Action">Action</option>
                                    <option value="Comedy">Comedy</option>
                                    <option value="Drama">Drama</option>
                                    <option value="Romance">Romance</option>
                                    <option value="Thriller">Thriller</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td><textarea name="description" rows="5" cols="40"></textarea></td>
                        </tr>
                        <tr>
                            <td>Rating ( /10)</td>
                            <td><input type="number" name="rating" step="1" min="0" max="10" style="width: 100%" value=""></td>
                        </tr>
                        <tr>
                            <td>Release Date</td>
                            <td><input type="date" name="releasedate" style="width: 100%" value=""></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><a href="https://postimage.io/" target="_blank">Upload Image</a></td>
                        </tr>
                        <tr>
                            <td>Cover Art URL</td>
                            <td>
                                <input type="url" name="coverart" maxlength="1024" value="https://urllocation/movie.jpg" style="width: 100%">
                            </td>
                        </tr>   
                        <tr>
                            <td>Price</td>
                            <td><input type="number" name="price" step="01" min="0" max="999" style="width: 100%" value=""></td>
                        </tr>
                        <tr>
                            <td>Quantity</td>
                            <td><input type="number" name="quantity" min="0" max="999" style="width: 100%" value=""></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><br><input type="submit" name="submit" value="Submit"></td>
                        </tr>
                    </table>
                </form>
                <br><a href="movieView.jsp">Back to Movie View</a>
                <% }
                else {
                    MovieDb manager = (MovieDb)session.getAttribute("manager");
                    //System.out.print(request.getParameter("releaseDate"));
                    String title = request.getParameter("title");
                    String genre = request.getParameter("genre");
                    String description = request.getParameter("description");
                    Double rating = Double.parseDouble(request.getParameter("rating"));
                    String releaseDate = request.getParameter("releasedate");
                    String coverArt = request.getParameter("coverart");
                    Double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));

                    if (!manager.movieExists(title)) {
                        manager.addMovie(title, genre, description, rating, releaseDate, coverArt, price, quantity);
                        %>
                        <h4 class="mb-4"><%=title%> added successfully.</h3>
                            <a href="addMovie.jsp">Add Another Movie</a><br>
                            <a href="moviemanagement.jsp">Back to Movie Management</a>
                        <% } else { %>
                        <h4 class="mb-4"><%=title%> already exists, choose a different Movie title name.</h3>
                            <a href="addmovie.jsp">Try Again</a><br>
                            <a href="moviemanagement.jsp">Back to Movie Management</a>
                        <% }      
                    }
                %>
            </div>
        </div>
    </body>
</html>