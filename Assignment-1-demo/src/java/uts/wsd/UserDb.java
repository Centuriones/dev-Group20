/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;
import java.sql.*;

/**
 *
 * @author LTChr
 */
public class UserDb {
    
    private Statement st;

    public UserDb(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
    
    public User getUser(String email) throws SQLException {
        String sqlQuery = String.format("SELECT * FROM USERS WHERE email = '%s'", email);
        ResultSet rs = st.executeQuery(sqlQuery);
        while(rs.next()) {
            return new User(rs.getString("email"), rs.getString("firstname"),
                    rs.getString("lastname"), rs.getString("password"),
                    rs.getString("phone"), rs.getBoolean("staff"));
        }
        return null;
    }
    
    public User getUser(String email, String password) throws SQLException {
        String sqlQuery = String.format("SELECT * FROM USERS WHERE email = '%s'", email);
        System.out.println(sqlQuery);
        ResultSet rs = st.executeQuery(sqlQuery);
        while(rs.next()) {
            User user = new User(rs.getString("email"), rs.getString("firstname"),
                    rs.getString("lastname"), rs.getString("password"),
                    rs.getString("phone"), rs.getBoolean("staff"));
            if (user.passwordMatches(password)) {
                return user;
            }
        }
        return null;
    }
    
    public boolean createUser(String email, String firstName, String lastName, String password, String phone, boolean staff) throws SQLException {
        String sqlQuery = String.format("INSERT INTO USERS VALUES('%s','%s','%s','%s','%s', %b)",
                email, firstName, lastName, password, phone, staff);
        System.out.println(sqlQuery);
        int result = st.executeUpdate(sqlQuery);
        
        if (result > 0) {
            return true;
        }
        return false;
    }
    
    public boolean updateUser(String email, String firstName, String lastName, String password, String phone, boolean staff) throws SQLException {
        String sqlQuery = String.format("UPDATE USERS SET firstname = '%s', lastname = '%s', password = '%s', phone = '%s', staff = %b WHERE email = '%s'",
                firstName, lastName, password, phone, staff, email);
        System.out.println(sqlQuery);
        int result = st.executeUpdate(sqlQuery);
        
        if (result > 0) {
            return true;
        }
        return false;
    }
    
    public void deleteUser(String email) throws SQLException{
        String sqlQuery = String.format("DELETE FROM USERS WHERE email = '%s'", email);
        st.executeUpdate(sqlQuery);
        
    }
}