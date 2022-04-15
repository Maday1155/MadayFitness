<%-- 
    Document   : edit_tech_support
    Created on : Apr 13, 2022, 10:07:59 PM
    Author     : maday
--%>

<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="ISO-8859-1"%>
<!DOCTYPE">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("id");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "maday_fitness";
    String userid = "root";
    String password = "password";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<html>
    <head>
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>

    <body>

        <h1>Updating Tech Support Data</h1>

        <table border="1">
            <tr>
                <td>ID</td>
                <td>Username</td>
                <td>First Name</td>
                <td>Last Name</td>
                <td>Password</td>
                <td>update</td>
            </tr>

            <%
                try {
                    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                    statement = connection.createStatement();
                    String sql = "select * from User;";
                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>
            <tr>
                <td><%=resultSet.getString("id")%></td>
                <td><%=resultSet.getString("username")%></td>
                <td><%=resultSet.getString("firstname")%></td>
                <td><%=resultSet.getString("lastname")%></td>
                <td><%=resultSet.getString("password")%></td>
                <td><a href="update.jsp?id=<%=resultSet.getString("id")%>">update</a></td>
            </tr>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </body>
</html>