<%-- 
    Document   : update-process
    Created on : Apr 2, 2022, 9:30:30 PM
    Author     : daniel
--%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/maday_fitness";%>
<%!String user = "root";%>
<%!String psw = "password";%>
<%
    String id = request.getParameter("id");
    String username = request.getParameter("username");
    String first_name = request.getParameter("firstname");
    String last_name = request.getParameter("lastname");
    String password = request.getParameter("password");
    if (id != null) {
        Connection con = null;
        PreparedStatement ps = null;

        int personID = Integer.parseInt(id);
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, psw);
            String sql = "Update User set id=?,firstname=?,lastname=?,username=?,password=? where id=" + id;
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, first_name);
            ps.setString(3, last_name);
            ps.setString(4, username);
            ps.setString(5, password);
            int i = ps.executeUpdate();
            if (i > 0) {
                out.print("Record Updated Successfully");
            } else {
                out.print("There is a problem in updating Record.");
            }
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }

%>
