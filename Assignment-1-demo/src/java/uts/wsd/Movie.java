package uts.wsd;
import java.io.Serializable;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author LTChr
 */
public class Movie implements Serializable {
    private int movieID, quantity;
    private String title, genre, description, coverArt, releaseDate;
    private double price, rating;
    
    public Movie() {
    }

    public Movie(int movieID, String title, String genre, String description, double rating, String releaseDate, String coverArt, double price, int quantity) {
        this.movieID = movieID;
        this.quantity = quantity;
        this.title = title;
        this.genre = genre;
        this.description = description;
        this.rating = rating;
        this.releaseDate = releaseDate;
        this.price = price;
        this.coverArt = coverArt;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getCoverArt() {
        return coverArt;
    }

    public void setCoverArt(String coverArt) {
        this.coverArt = coverArt;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    public String getShortDescription(int charLength) {
        String shortDescription;
        if (description.length() > charLength)  shortDescription = description.substring(0, charLength) + "...";
        else shortDescription = description;
        return shortDescription;
    }
    
    public String getFormattedDate() throws ParseException {
        SimpleDateFormat sqlFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat displayFormat = new SimpleDateFormat("dd/MM/yyyy");
        return displayFormat.format(sqlFormat.parse(releaseDate));
    }
    
    public String getFormattedPrice() {
        NumberFormat formatter = NumberFormat.getCurrencyInstance(); 
        return formatter.format(price).toString();
    } 
}