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
        <title>About Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/styleAbout.css" type="text/css"/>    
    </head>
    <body>


        <div class="about-section">
            <div style="float:right">
                <a href="Login.jsp" class="btn btn-success">Login</a> 
            </div>

            <h1 class="ex1">About Us Page</h1>
            <h2>What we are about?</h2>
            <p class="ex1">This is a monthly event held the first Saturday of the month at
                different parks in the Greater Miami area. Come work out with your dog. You 
                take care of yourself, your dog deserves the same! We start off with
                socializing them for 10-15 minutes and then a 50 minute yoga session follows 
                led by Brian Cohen. Don't have a dog? Don't worry, all are welcome.</p>
        </div>

        <h2 style="text-align:center"; class="ex1">Our Team</h2>
        <div class="row">
            <div class="column">
                <div class="card">
                    <img src="images/Maday.jpeg" alt="Maday" style="width:100%"; height:5vm; object-fit: cover;>
                    <div class="container">
                        <h2>Maday Cohen</h2>
                        <p class="title">Lead Instructor</p>
                        <p>I strive to provide a balanced guidance by designing a program that 
                            incorporates the various components to meet your goals. Allow me to 
                            help you create a healthy lifestyle using proper exercise, and meditation 
                            techniques that will change your life.</p>
                        <p>maday@mymdc.net</p>
                        <p><button class="button" <a href="mailto:maday.cohen001@mymdc.net"> </a>Contact</button></p>
                    </div>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <img src="https://www.w3schools.com/w3images/team2.jpg" alt="Brian" style="width:100%"; height:15vw; object-fit: cover; >
                    <div class="container">
                        <h2>Brian Cohen</h2>
                        <p class="title">Doga Instructor</p>
                        <p>I strive to provide a balanced guidance by designing a program that 
                            incorporates the various components to meet your goals. Allow me to 
                            help you create a healthy lifestyle using proper exercise, and meditation 
                            techniques that will change your life.</p>
                        <p>maday@mymdc.net</p>
                        <p><button class="button" <a href="mailto:maday.cohen001@mymdc.net"> </a>Contact</button></p>
                    </div>
                </div>
            </div>
        </div>


        <video controls>
            <source src="images/sample.mp4" type=video/mp4>
            Sorry, your browser doesn't support embedded videos.
        </video>
        <%@ include file = "include/footer.jsp" %>
    </body>
</html>
