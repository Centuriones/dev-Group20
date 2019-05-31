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
    
    private Statement stm;

    public UserDb(Connection conn) throws SQLException {
        stm = conn.createStatement();
    }
    
    public User getUser(String email) throws SQLException {
        String sqlQuery = String.format("SELECT * FROM USERS WHERE email = '%s'", email);
        ResultSet rset = stm.executeQuery(sqlQuery);
        while(rset.next()) {
            return new User(rset.getString("email"), rset.getString("firstname"),
                    rset.getString("lastname"), rset.getString("password"),
                    rset.getString("phone"), rset.getBoolean("staff"));
        }
        return null;
    }
    
    public User getUser(String email, String password) throws SQLException {
        String sqlQuery = String.format("SELECT * FROM USERS WHERE email = '%s'", email);
        System.out.println(sqlQuery);
        ResultSet rset = stm.executeQuery(sqlQuery);
        while(rset.next()) {
            User user = new User(rset.getString("email"), rset.getString("firstname"),
                    rset.getString("lastname"), rset.getString("password"),
                    rset.getString("phone"), rset.getBoolean("staff"));
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
        int result = stm.executeUpdate(sqlQuery);
        
        if (result > 0) {
            return true;
        }
        return false;
    }
    
    public boolean updateUser(String email, String firstName, String lastName, String password, String phone, boolean staff) throws SQLException {
        String sqlQuery = String.format("UPDATE USERS SET firstname = '%s', lastname = '%s', password = '%s', phone = '%s', staff = %b WHERE email = '%s'",
                firstName, lastName, password, phone, staff, email);
        System.out.println(sqlQuery);
        int result = stm.executeUpdate(sqlQuery);
        
        if (result > 0) {
            return true;
        }
        return false;
    }
    
    public void deleteUser(String email) throws SQLException{
        String sqlQuery = String.format("DELETE FROM USERS WHERE email = '%s'", email);
        stm.executeUpdate(sqlQuery);
        
    }
}