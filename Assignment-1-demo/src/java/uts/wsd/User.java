/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

/**
 *
 * @author CZC
 */
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)

public class User implements Serializable{
    private String email;
    private String firstName;
    private String lastName;
    private String password;
    private String phone;
    private boolean staff;
    public User(){
        super();
    }
    public User(String email,String firstName,String lastName,String password,String phone,boolean staff){
        super();
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.phone = phone;
        this.staff = staff;
    }
    public String getEmail(){
        return email;
    }
    public void  setEmail(String email){
        this.email = email;
    }
    public String getFirstName(){
        return firstName;
    }
    public void  setFirstName(String firstName){
        this.firstName = firstName;
    }
    public String getLastName(){
        return lastName;
    }
    public void  setName(String lastName){
        this.lastName = lastName;
    }
    public String getPassword(){
        return password;
    }
    public void  setPassword(String password){
        this.password = password;
    }
    public String getPhone(){
        return phone;
    }
    public void  setPhone(String phone){
        this.phone = phone;
    }
    public boolean getStaff(){
        return staff;
    }
    public void  setStaff(boolean staff){
        this.staff = staff;
    }
    public boolean passwordMatches(String password) {
        if(this.password.equals(password)) {
            return true;
        }
        return false;
    }
}
