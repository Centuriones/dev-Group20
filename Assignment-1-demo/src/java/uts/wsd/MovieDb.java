package uts.wsd;

import java.sql.*;

/**
 *
 * @author George
 
 MovieDao is the primary DAO class to interact with the database and perform CRUD operations with the db.
 Firstly, complete the existing methods and implement them into the application.
 
 So far the application uses the Read and Create operations in the view.
 Secondly, improve the current view to enable the Update and Delete operations.
 */
public class MovieDb {

    private Statement stm;
    private ResultSet rset;
    private String sqlQuery;

    public MovieDb(Connection conn) throws SQLException {
        stm = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    }

    public Movie searchMovie(int movieID) throws SQLException {
        sqlQuery = String.format("SELECT * FROM MOVIES WHERE MOVIEID = %s", movieID);
        rset = stm.executeQuery(sqlQuery);
        rset.next();
        return new Movie(rset.getInt("MovieID"), rset.getString("Title"), rset.getString("Genre"), rset.getString("Description"), rset.getDouble("Rating"), rset.getString("ReleaseDate"), rset.getString("CoverArt"), rset.getDouble("Price"), rset.getInt("Quantity"));
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
        rset = stm.executeQuery(sqlQuery);
        
        int rows = 0;
        while (rset.next()) rows++;
        rset.beforeFirst();
        
        Movie[] movies = new Movie[rows];
        int currentRow = 0;
        while (rset.next()) {
            movies[currentRow] = new Movie(rset.getInt("MovieID"), rset.getString("Title"), rset.getString("Genre"), rset.getString("Description"), rset.getDouble("Rating"), rset.getString("ReleaseDate"), rset.getString("CoverArt"), rset.getDouble("Price"), rset.getInt("Quantity"));
            currentRow ++;
        }
        return movies;
    }

    public boolean movieExists(String title) throws SQLException {
        sqlQuery = "SELECT MOVIEID FROM MOVIES WHERE TITLE ='" + title + "'";
        rset = stm.executeQuery(sqlQuery);
        if (rset.next()) return true;
        else return false;
    }
    
    public int getNextMovieID() throws SQLException {
        int max = 0;
        sqlQuery = "SELECT MOVIEID FROM MOVIES";
        rset = stm.executeQuery(sqlQuery);
        while (rset.next()) {
            int currentMovieID = rset.getInt("MovieID");
            if (currentMovieID > max) max = currentMovieID;
        }
        return max + 1;
    }

    public void addMovie(String title, String genre, String description, Double rating, String releaseDate, String coverArt, Double price, int quantity) throws SQLException {        
        int movieID = getNextMovieID();        
        sqlQuery = String.format("INSERT INTO MOVIES VALUES(%s,'%s','%s','%s',%s,'%s','%s',%s,%s)",movieID, title, genre, description, rating, releaseDate, coverArt, price, quantity);
        stm.executeUpdate(sqlQuery);
    }

    public void editMovie(int movieID, String title, String genre, String description, Double rating, String releaseDate, String coverArt, Double price, int quantity) throws SQLException {
        sqlQuery = String.format("UPDATE MOVIES SET TITLE='%s',GENRE='%s',DESCRIPTION='%s',RATING=%s,RELEASEDATE='%s',COVERART='%s',PRICE=%s,QUANTITY=%s WHERE MOVIEID=%s", title, genre, description, rating, releaseDate, coverArt, price, quantity, movieID);
        stm.executeUpdate(sqlQuery);
    }
    
    public void deleteMovie(int movieID) throws SQLException {
        sqlQuery = String.format("DELETE FROM MOVIES WHERE MOVIEID = %s", movieID);
        stm.executeUpdate(sqlQuery);
    }
}
