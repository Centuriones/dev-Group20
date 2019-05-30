package uts.wsd;

import uts.wsd.Movie;
import java.sql.*;

/**
 *
 * @author George
 
 MovieDao is the primary DAO class to interact with the database and perform CRUD operations with the db.
 Firstly, complete the existing methods and implement them into the application.
 
 So far the application uses the Read and Create operations in the view.
 Secondly, improve the current view to enable the Update and Delete operations.
 */
public class MovieDao {

    private Statement st;
    private ResultSet rs;
    private String sqlQuery;

    public MovieDao(Connection conn) throws SQLException {
        st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    }

    public Movie searchMovie(int movieID) throws SQLException {
        sqlQuery = String.format("SELECT * FROM MOVIES WHERE MOVIEID = %s", movieID);
        rs = st.executeQuery(sqlQuery);
        rs.next();
        return null;
        //Needs to change movie constructor//return new Movie(rs.getInt("MovieID"), rs.getString("Title"), rs.getString("Genre"), rs.getString("Description"), rs.getDouble("Rating"), rs.getString("ReleaseDate"), rs.getString("CoverArt"), rs.getDouble("Price"), rs.getInt("Quantity"));
    }
    
    public Movie[] searchMovies(String title, String genre) throws SQLException {
        sqlQuery = "SELECT * FROM Movies";

            if (title != null || genre != null) {
                if (title.length() > 0 || genre.length() > 0) {
                    sqlQuery += " WHERE ";
                    if (title.length() > 0) {
                        sqlQuery += " LOWER(title) like '%" + title.toLowerCase() + "%'";
                        if (genre.length() > 0) sqlQuery += " AND LOWER(genre) like '%" + genre.toLowerCase() + "%'";
                    }
                    else if (genre.length() > 0) {
                        sqlQuery += " LOWER(genre) like '%" + genre.toLowerCase() + "%'";
                    }
                }
            }
        sqlQuery += " ORDER BY TITLE";
        rs = st.executeQuery(sqlQuery);
        
        int rows = 0;
        while (rs.next()) rows++;
        rs.beforeFirst();
        
        Movie[] movies = new Movie[rows];
        int currentRow = 0;
        while (rs.next()) {
            //movies[currentRow] = new Movie(rs.getInt("MovieID"), rs.getString("Title"), rs.getString("Genre"), rs.getString("Description"), rs.getDouble("Rating"), rs.getString("ReleaseDate"), rs.getString("CoverArt"), rs.getDouble("Price"), rs.getInt("Quantity"));
            currentRow ++;
        }
        return movies;
    }

    public boolean movieExists(String title) throws SQLException {
        sqlQuery = "SELECT MOVIEID FROM MOVIES WHERE TITLE ='" + title + "'";
        rs = st.executeQuery(sqlQuery);
        if (rs.next()) return true;
        else return false;
    }
    
    public int getNextMovieID() throws SQLException {
        int max = 0;
        sqlQuery = "SELECT MOVIEID FROM MOVIES";
        rs = st.executeQuery(sqlQuery);
        while (rs.next()) {
            int currentMovieID = rs.getInt("MovieID");
            if (currentMovieID > max) max = currentMovieID;
        }
        return max + 1;
    }

    public void addMovie(String title, String genre, String description, Double rating, String releaseDate, String coverArt, Double price, int quantity) throws SQLException {        
        int movieID = getNextMovieID();        
        sqlQuery = String.format("INSERT INTO MOVIES VALUES(%s,'%s','%s','%s',%s,'%s','%s',%s,%s)",movieID, title, genre, description, rating, releaseDate, coverArt, price, quantity);
        st.executeUpdate(sqlQuery);
    }

    public void editMovie(int movieID, String title, String genre, String description, Double rating, String releaseDate, String coverArt, Double price, int quantity) throws SQLException {
        sqlQuery = String.format("UPDATE MOVIES SET TITLE='%s',GENRE='%s',DESCRIPTION='%s',RATING=%s,RELEASEDATE='%s',COVERART='%s',PRICE=%s,QUANTITY=%s WHERE MOVIEID=%s", title, genre, description, rating, releaseDate, coverArt, price, quantity, movieID);
        st.executeUpdate(sqlQuery);
    }
    
    public void deleteMovie(int movieID) throws SQLException {
        sqlQuery = String.format("DELETE FROM MOVIES WHERE MOVIEID = %s", movieID);
        st.executeUpdate(sqlQuery);
    }
}
