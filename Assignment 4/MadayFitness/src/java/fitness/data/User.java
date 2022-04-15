/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fitness.data;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author daniel
 */
public class User implements Serializable {
    private String username;
    private String password;
    private String firstName;
    private String lastName;

    public User(String username, String password, String firstName, String lastName) {
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public User() {
        this.username = "";
        this.password = "";
        this.firstName = "";
        this.lastName = "";
    }        

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String newFirstName) {
        firstName = newFirstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String newLastName) {
        lastName = newLastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String newPassword) {
        password = newPassword;
    }

    public String getUsername() {
        return username;
    }

    public void setUserName(String newUsername) {
        username = newUsername;
    }   
}
