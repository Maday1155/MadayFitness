<%-- 
    Document   : add_tech_support
    Created on : Apr 12, 2022, 4:21:34 PM
    Author     : maday
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Adding New User</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>
    <h1 style="text-align:center; color:white;">Please enter the details of the User</h1>

    <form action="add"  method="post" style="margin: auto; width: 350px;">
        <table cellspacing="5" cellpadding="5" border="2" bgcolor="A9A9A9">
            <tr>
                <td align="right">First Name:</td>
                <td><input type="text" name="FirstName"></td>
            </tr>
            <tr>
                <td align="right">Last Name:</td>
                <td><input type="text" name="LastName"></td>
            </tr>
            <tr>
                <td align="right">Username:</td>
                <td><input type="text" name="UserName"></td>
            </tr>
            <tr>
                <td align="right">Password:</td>
                <td><input type="password" name="Password"></td>
            </tr>
        </table>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
