<%-- 
    Document   : register
    Created on : Jan 15, 2021, 10:49:41 PM
    Author     : CASSIE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/Style.css">
        <script src="js/main.js"></script>
        <title>Register</title>
    </head>
    <body>
        <div class="container">
            <div class="news-section">
                <div class="news-item">
                    <p>Server maintennace is hapening!</p>
                </div>
                <i class="material-icons">&#xe5cd;</i>
            </div>
            <div class="hero-section">
                <div class="nav">
                    <div class="nav-left">
                        <a href="${pageContext.request.contextPath}/Index">Start up.</a>
                    </div>
                    <div class="nav-right">
                        <a href="${pageContext.request.contextPath}/Campaing">Start campaing</a>
                        <a href="${pageContext.request.contextPath}/Explore">Explore</a>
                        <i class="material-icons" onclick="openNav()">&#xe5c3;</i>
                        <div id="mySidenav" class="sidenav">
                            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                            <a href="${pageContext.request.contextPath}/Account">Account</a>
                            <a href="${pageContext.request.contextPath}/Explore">Explore</a>
                            <a href="${pageContext.request.contextPath}/Campaing">Campaing</a>
                            <a href="${pageContext.request.contextPath}/Login">Login</a>
                            <a href="${pageContext.request.contextPath}/RegisterUser">Register</a>
                        </div>
                    </div>
                </div>
                <div class="register-form-content">
                    <div class="register-form-content-left">
                        <h1>Be a Entrepreneur</h1>
                    </div>
                    <div class="register-form-content-right">
                        <div class="form-area">
                            <form method="GET" action="RegisterUser" class="form">
                                <div class="form-input-box">
                                    <input type="text" placeholder="Full Name" name = "name" class="form-input-item">
                                </div>
                                <div class="form-input-box">
                                    <input type="text" placeholder="Contact no" name = "contact" class="form-input-item">
                                </div>
                                <div class="form-input-box">
                                    <input type="text" placeholder="Birthday" name = "dob" class="form-input-item">
                                </div>
                                <div class="form-input-box">
                                    <input type="text" placeholder="Country" name = "country" class="form-input-item">
                                </div>
                                <div class="form-input-box">
                                    <input type="text" placeholder="Username" name = "username" class="form-input-item">
                                </div>
                                <div class="form-input-box">
                                    <input type="text" placeholder="Password" name = "password" class="form-input-item">
                                </div>

                                <input type="submit" value="Register" class="register-form-button">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-section">
                <!--Put Column in here-->
            </div>
        </div>
    </body>
</body>
</html>
