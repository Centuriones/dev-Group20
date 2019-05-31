/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;
import java.util.Date;
import java.sql.*;
/**
 *
 * @author LTChr
 */
public class LoginsessionDb {
    private Statement stm;
    public LoginsessionDb(Connection conn) throws SQLException {
        stm = conn.createStatement();
    }
    
    public void addLogintime(String loginid, Timestamp logintime, String email) throws SQLException {
        String sqlcommand = "insert into log (loginid, login, email) values('"+loginid+"','"+logintime+"', '"+email+"')";
        stm.executeUpdate(sqlcommand);
    }
    
    public void addLogouttime(String loginid, Timestamp logouttime) throws SQLException {
        String sqlcommand = "update log set logout = '"+logouttime+"' where loginid = '"+loginid+"'";
        stm.executeUpdate(sqlcommand);
    }
    
    public ResultSet getLogintime(String email) throws SQLException {
        String sqlcommand = "select * from log where userid = '"+email+"' order by login";
        ResultSet rset = stm.executeQuery(sqlcommand);
        return rset;
    }
    
    public void removeLogin(String loginid) throws SQLException {
        String sqlcommand = "delete from log where loginid = '"+loginid+"'";
        stm.executeUpdate(sqlcommand);
    }
    
    public ResultSet getLogintime(String email, Date date) throws SQLException {
        String sqlcommand = "select * from log where userid = '"+email+"' and DATE(login) = '"+date+"'";
        ResultSet rset = stm.executeQuery(sqlcommand);
        return rset;
    }
}