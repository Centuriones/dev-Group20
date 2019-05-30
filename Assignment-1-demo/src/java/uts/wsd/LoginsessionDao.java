/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;
import java.sql.*;
import java.util.Date;
/**
 *
 * @author LTChr
 */
public class LoginsessionDao {
    private Statement st;
    public LoginsessionDao(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
    
    public void addLogintime(String loginid, Timestamp logintime, String email) throws SQLException {
        String sqlcommand = "insert into log (loginid, login, userid) values('"+loginid+"','"+logintime+"', '"+email+"')";
        st.executeUpdate(sqlcommand);
    }
    
    public void addLogouttime(String loginid, Timestamp logouttime) throws SQLException {
        String sqlcommand = "update log set logout = '"+logouttime+"' where loginid = '"+loginid+"'";
        st.executeUpdate(sqlcommand);
    }
    
    public ResultSet getLogintime(String email) throws SQLException {
        String sqlcommand = "select * from log where userid = '"+email+"' order by login";
        ResultSet rs = st.executeQuery(sqlcommand);
        return rs;
    }
    
    public void removeLogin(String loginid) throws SQLException {
        String sqlcommand = "delete from log where loginid = '"+loginid+"'";
        st.executeUpdate(sqlcommand);
    }
    
    public ResultSet getLogintime(String email, Date date) throws SQLException {
        String sqlcommand = "select * from log where userid = '"+email+"' and DATE(login) = '"+date+"'";
        ResultSet rs = st.executeQuery(sqlcommand);
        return rs;
    }
    
}

