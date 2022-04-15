<%-- 
    Document   : view_tech_support
    Created on : Apr 2, 2022, 3:01:32 AM
    Author     : daniel
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("userid");
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
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>

        <h1>Retrieve data from database</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>Username</td>
                <td>First Name</td>
                <td>Last Name</td>
                
            </tr>
            <%
                try {
                    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                    statement = connection.createStatement();
                    String sql = "select * from User;";
                    resultSet = statement.executeQuery(sql);
                    System.out.println("///Hello//////////");
                    while (resultSet.next()) {
            %>
            <tr>
                <td><%=resultSet.getString("id")%></td>
                <td><%=resultSet.getString("username")%></td>
                <td><%=resultSet.getString("firstname")%></td>
                <td><%=resultSet.getString("lastname")%></td>
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