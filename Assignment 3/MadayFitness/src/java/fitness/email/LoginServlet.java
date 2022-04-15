/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
    Document   : LoginServlet
    Created on : Mar 21, 2022, 12:29:57 AM
    Author     : maday
*/

package fitness.email;

import fitness.data.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static fitness.data.UserIO.verifyLogin;
import javax.servlet.http.HttpSession;

/**
 *
 * @author maday
 */
@WebServlet(name = "login", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String _username = request.getParameter("username");
            String _password = request.getParameter("password");
            if (_username != null || _password != null) {
                //if (_username.equals("maday") && _password.equals("1234")) {
                if (verifyLogin(_username, _password)) {
                    //Setting up new user
                    User newUser = new User();
                    newUser.setUserName(_username);
                    newUser.setPassword(_password);

                    //SETTING UP THE SESSION
                    HttpSession session = request.getSession();
                    session.setAttribute("username", "_username");
                    //REDIRECTING TO THE NEW PAGE
                    response.sendRedirect("Welcome.jsp");
                } else {
                    out.println("Invalid username or password");
                }

            } else {
                out.println("Empty username or password");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

