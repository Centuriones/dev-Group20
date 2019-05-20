package uts.wsd;


import java.io.Serializable;
import java.util.ArrayList;

public class Users implements Serializable {
    private ArrayList<User> list = new ArrayList<User>();
    
    public Users() {
    }

    public ArrayList<User> getList() {//get function for invoking
        return list;//return
    }

    public void addUser(User user) {//add function for invoking
        list.add(user);////add input user to users
    }
   
    public User getUser(String email) {//get user by input email
        for (User user : list) {//for loop the check all user
            if (user.getEmail().equals(email)) {//if any user's email equals input email
                return user;//return that user
            }
        }
        return null;//if doesn't match any user, return null
    }

    public User login(String email, String password) {
        // For each user in the list...
        for (User user : list) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user; // Login correct. Return this user.
            }
        }
        return null; // Login incorrect. Return null.
    }
    
    public String getFirstUser() {
        for (User user : list) {//for loop the check all user
            if (!user.equals(null)) {
                return user.getEmail() + user.getPassword();//return that user
            }
        }
        return "nothin found";//if doesn't match any user, return null
    }
}