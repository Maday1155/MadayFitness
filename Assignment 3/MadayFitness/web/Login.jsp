<%-- 
    Document   : login
    Created on : Feb 14, 2022, 12:29:57 AM
    Author     : maday
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <div class="login">
                    <div class="login-header">
                        <h3><span style="font-weight:bold;">LOGIN</span></h3>
                        <p>Please enter your credentials to login.</p>
                    </div>
                </div>
                <form class="login-form" action="Login" method="POST">
                    <input type="text" placeholder="username" name="username"/>
                    <input type="password" placeholder="password" name="password"/>
                    <button>login</button>
                    <p class="message">Not registered? <a href="#"> <u> Create an account </u<</a></p>
                </form>
            </div>
        </div>
        <%@ include file = "include/footer.jsp" %>
    </body>
</html>
