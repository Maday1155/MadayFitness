<%-- 
    Document   : update
    Created on : Apr 13, 2022, 9:17:08 PM
    Author     : maday
--%>

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
<%
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        String sql = "select * from User where id=" + id;
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Updating User Data</h1>
        <form method="post" action="update-process.jsp">
            <input type="hidden" name="id" value="<%=resultSet.getString("id")%>">
            <input type="text" name="id" value="<%=resultSet.getString("id")%>">
            <br>
            First name:<br>
            <input type="text" name="firstname" value="<%=resultSet.getString("firstname")%>">
            <br>
            Last name:<br>
            <input type="text" name="lastname" value="<%=resultSet.getString("lastname")%>">
            <br>
            Username:<br>
            <input type="text" name="username" value="<%=resultSet.getString("username")%>">
            <br>
            Password:<br>
            <input type="text" name="password" value="<%=resultSet.getString("password")%>">
            <br><br>
            <input type="submit" value="submit">
        </form>
        <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
