/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;
import java.io.Serializable;
import java.sql.*;
/**
 *
 * @author LTChr
 */
public class LoginsessionClass implements Serializable {
    private String loginid;
    private Timestamp logintime;
    private Timestamp logouttime;
    private String email;
    
    public LoginsessionClass() {}
    
    public LoginsessionClass(String loginid, Timestamp logintime, String email) {
        this.loginid = loginid;
        this.logintime = logintime;
        this.email = email;
    }
    
    public String getLoginid() {
        return this.loginid;
    }
    public void setLoginid (String loginid) {
        this.loginid = loginid;
    }
    public Timestamp getLogintime() {
        return this.logintime;
    }
    public void setLogintime (Timestamp logintime) {
        this.logintime = logintime;
    }
    public Timestamp getLogouttime() {
        return this.logouttime;
    }
    public void setLogouttime (Timestamp logouttime) {
        this.logouttime = logouttime;
    }
    public String getEmail() {
        return this.email;
    }
    public void setEmail (String email) {
        this.email = email;
    }
}
