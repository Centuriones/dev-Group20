<%-- 
    Document   : movieView
    Created on : 31/05/2019, 8:59:54 PM
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
        <title>Browse Movies</title>
    </head>
    <body>
        <div>
        <br>
        <h2>Browse Movies</h2>
        <p><a href="addMovie.jsp">Add Movie  </a><a href="movieDelete.jsp">  Delete Movie</a></p>
        <%
            MovieDb manager = (MovieDb)session.getAttribute("manager");
            Movie[] allMovies = manager.searchMovies(null, null);
            System.out.println(allMovies[0].getCoverArt());
            for (int x = 0; x < allMovies.length; x ++) {
                session.setAttribute("id", allMovies[x].getMovieID());
                %>
                <div>
                    <div>
                        
                        <div>
                            <img src="<%=allMovies[x].getCoverArt()%>" alt="Atomic Blonde" height="240" width="160">
                        </div>
                        <div>
                            <div>
                                <h5><%=allMovies[x].getTitle()%></h5>
                                <p><%=allMovies[x].getShortDescription(300)%></p>
                                <p><a href="moviedetails.jsp?id=<%=allMovies[x].getMovieID()%>" role="button">More Details</a></p>
                                <form action="movieDelete.jsp" method="POST" name="id"> 
                                    ID = <input type="text" style="border: 0" value="<%=allMovies[x].getMovieID()%>" id="s" name="s">    
                                    <p><button type="submit" >Delete Movie</button></p>
                                </form>
                                
                            </div>
                        </div>
                        
                    </div>
                </div>
                <%
            }
        %>
        </div>
    </body>
</html>