<%-- 
    Document   : campaing
    Created on : Jan 15, 2021, 9:45:00 PM
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
                <div class="campaing-section">
                    <div class="campaing-form">
                        <form method="POST" action="Campaing">
                            <div class="campaing-form-item-box">
                                <input type="text" name="title" placeholder="Project Title" class="campaing-form-item">
                            </div>
                            <div class="campaing-form-item-box">
                                <input type="text" name="category" placeholder="Category" class="campaing-form-item">
                            </div>
                            <div class="campaing-form-item-box">
                                <input type="text" name="description" placeholder="Description" class="campaing-form-item">
                            </div>
                            <div class="campaing-form-item-box">
                                <input type="text" name="ambition" placeholder="Ambition" class="campaing-form-item">
                            </div>
                            <div class="campaing-form-item-box">
                                <input type="text" name="future" placeholder="Future" class="campaing-form-item">
                            </div>
                            <div class="campaing-form-item-box">
                                <input type="text" name="explanation" placeholder="Explanation" class="campaing-form-item">
                            </div>
                            <div class="campaing-form-item-box">
                                <input type="text" name="video" placeholder="Project Video Link" class="campaing-form-item">
                            </div>
                            <div class="campaing-form-item-box">
                                <input type="text" name="expFundPrice" placeholder="Fund amount" class="campaing-form-item">
                            </div>
                            <div class="campaing-form-item-box">
                                <input type="submit" value="Start" class="campaing-form-button">
                            </div>
                        </form>
                    </div>
                    <div class="campaing-form-text-area">
                        Start your dream Hear!
                    </div>
                </div>
            </div>
            <div class="footer-section">
                <!--Put Column in here-->
            </div>
