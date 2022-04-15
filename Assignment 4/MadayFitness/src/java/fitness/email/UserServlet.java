/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fitness.email;

import fitness.data.User;
import fitness.data.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daniel
 */
public class UserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet New</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet New at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList al = new ArrayList();
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String firstname = request.getParameter("FirstName");
        String lastname = request.getParameter("LastName");
        String username = request.getParameter("UserName");
        String password = request.getParameter("Password");

        UserDB userdb = new UserDB();
        al = userdb.validateUser(username, password, firstname, lastname);
        if (!al.isEmpty()) {
            pw.println(al);
        } else {
            User user = new User(username, password, firstname, lastname);
            UserDB.insert(user);
            response.getWriter().println("<html><body>User Added!!!</body></html>");

        }

    }
}
