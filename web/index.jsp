<%-- 
    Document   : index
    Created on : Jan 15, 2021, 5:02:30 PM
    Author     : CASSIE
--%>

<%@page import="Startup.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/Style.css">
        <script src="js/main.js"></script>
        <title>Home</title>
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
                <div class="hero-content">
                    <div class="hero-section-left">
                        <h1>Make your dream!</h1>
                        <p>Rocha admits to a preference of using specialist books over the internet when in these early research stages</p>
                        <a href="#">Start a campaing</a>
                    </div>
                    <div class="hero-section-right">

                    </div>
                </div>
            </div>
            <div class="two-section">
                <div class="explore-complete-project-area">                    
                    <p class="heading-one">Successpull project titles</p>
                    <div class="project-box">
                        <%

                            String title = "";
                            String description = "";
                            String state = "";
                            String link = "";

                            try {
                                ResultSet rs = Database.getData("SELECT prg_name, prg_description, prg_exp_fund, prg_curr_fund, use_id, prg_vid_link FROM Project WHERE prg_state = '1'");
                                while (rs.next()) {
                                    double amountOne = rs.getDouble("prg_exp_fund");
                                    double amountTwo = rs.getDouble("prg_curr_fund");

                                    title = rs.getString("prg_name");
                                    description = rs.getString("prg_description");
                                    link = rs.getString("prg_vid_link");

                                    if (amountOne > amountTwo) {
                                        //Not complete project.
                                        continue;
                                    } else {
                                        //Complete project.
                                        state = "Complete";
                                    }

                        %>
                        <div class="box">

                            <div class="upper-box-area">
                                <p class="box-title"><% out.print(title); %></p>
                            </div>
                            <div class="box-lower-area">
                                <p class="box-description"><% out.print(description); %></p>
                                <p class="box-state"><% out.print(state); %></p>
                            </div>
                        </div>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </div>
                </div>
            </div>
            <div class="three-section">
                <div class="explore-pending-project-area">
                    <p class="heading-one">Start up project titles</p>
                    <div class="project-box">
                        <%
                            String ptitle = "";
                            String pdescription = "";
                            String pstate = "";
                            String plink = "";

                            try {
                                ResultSet rs = Database.getData("SELECT prg_name, prg_description, prg_exp_fund, prg_curr_fund, use_id, prg_vid_link FROM Project WHERE prg_state = '1'");
                                while (rs.next()) {
                                    double amountOne = rs.getDouble("prg_exp_fund");
                                    double amountTwo = rs.getDouble("prg_curr_fund");

                                    ptitle = rs.getString("prg_name");
                                    pdescription = rs.getString("prg_description");
                                    plink = rs.getString("prg_vid_link");

                                    if (amountOne > amountTwo) {
                                        //Not complete project.
                                        pstate = "Funding";
                                    } else {
                                        //Complete project.
                                        continue;
                                    }

                        %>
                        <div class="box">

                            <div class="upper-box-area">
                                <p class="box-title"><% out.print(title); %></p>
                            </div>
                            <div class="box-lower-area">
                                <p class="box-description"><% out.print(description); %></p>
                                <p class="box-state"><% out.print(state); %></p>
                            </div>
                        </div>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </div>
                </div>
            </div>
            <div class="footer-section">
                <!--Put Column in here-->
            </div>
        </div>
    </body>
</html>
