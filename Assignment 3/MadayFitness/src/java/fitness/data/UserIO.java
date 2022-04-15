/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
    Document   : LoginServlet
    Created on : Mar 21, 2022
    Author     : maday
*/
package fitness.data;

import java.util.*;
import java.io.*;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

/**
 *
 * @author maday
 */
public class UserIO {

    private static Scanner x;

    public static boolean verifyLogin(String username, String password) {
        String filepath = "/home/daniel/NetBeansProjects/MadayFitness/web/WEB-INF/login_credentials.txt";
        boolean found = false;
        String tempUsername = "";
        String tempPassword = "";

        try {
            x = new Scanner(new File(filepath));
            x.useDelimiter("[,\n]");

            while (x.hasNext() && !found) {
                tempUsername = x.next();
                tempPassword = x.next();

                if (tempUsername.trim().equals(username.trim()) && tempPassword.trim().equals(password.trim())) {
                    found = true;
                }
            }
            x.close();
            System.out.println(found);
        } catch (Exception e) {
            System.out.println(found);
        }
        return found;
    }
}
