<%-- 
    Document   : project
    Created on : Jan 15, 2021, 9:45:45 PM
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
                <%
                    String project = "";
                    String category = "";
                    String raisedFund = "";
                    String fundCapacity = "";
                    String description = "";
                    String explanation = "";
                    String ambition = "";
                    String future = "";
                    String userName = "";

                    String id = request.getParameter("id");
                    ResultSet rs = Database.getData("SELECT prg_name, prg_description, prg_ambition, prg_explanation, prg_future, prg_exp_fund, prg_curr_fund, use_id, prg_category FROM Project WHERE prg_id = '" + id + "' ");
                    if (rs.next()) {
                        project = rs.getString("prg_name");
                        category = rs.getString("prg_category");
                        raisedFund = rs.getString("prg_curr_fund");
                        fundCapacity = rs.getString("prg_exp_fund");
                        description = rs.getString("prg_description");
                        explanation = rs.getString("prg_explanation");
                        ambition = rs.getString("prg_ambition");
                        future = rs.getString("prg_future");

                        ResultSet rs1 = Database.getData("SELECT use_name FROM User WHERE use_id = '" + rs.getString("use_id") + "'");
                        if (rs1.next()) {
                            userName = rs1.getString("use_name");
                        }

                    }
                %>
                <div class="hero-content">
                    <div class="hero-column-one">
                        <div class="hero-column-input">
                            <div class="hero-text">
                                Holder
                            </div>
                            <input type="text" name="" value="<%= userName%>">
                        </div>
                        <div class="hero-column-input">
                            <div class="hero-text">
                                Project
                            </div>
                            <input type="text" name="" class="" value="<%= project%>">
                        </div>
                        <div class="hero-column-input">
                            <div class="hero-text">
                                Category
                            </div>
                            <input type="text" name="" class="" value="<%= category%>">
                        </div>
                        <div class="hero-column-input">
                            <div class="hero-text">
                                Raised Fund
                            </div>
                            <input type="text" name="" class="" value="<%= raisedFund%>">
                        </div>
                        <div class="hero-column-input">
                            <div class="hero-text">
                                Fund capacity
                            </div>
                            <input type="text" name="" class="" value="<%= fundCapacity%>">
                        </div>
                    </div>
                    <div class="hero-column-two">
                        <div class="hero-column-input">
                            <div class="hero-text">
                                Description
                            </div>
                            <input type="textview" name="" class="hero-proj-Ambition" value="<%= description%>">
                        </div>
                        <div class="hero-column-input">
                            <div class="hero-text">
                                Explanation
                            </div>
                            <input type="textview" name="" class="hero-proj-Explanation" value="<%= explanation%>">
                        </div>
                    </div>
                    <div class="hero-column-three">
                        <div class="hero-column-input">
                            <div class="hero-text">
                                Ambition    
                            </div>
                            <input type="textview" name="" class="hero-proj-description" value="<%= ambition%>">
                        </div>
                        <div class="hero-column-input">
                            <div class="hero-text">
                                Future
                            </div>
                            <input type="textview" name="" class="hero-proj-Future" contenteditable="false" value="<%= future%>">
                        </div>  
                    </div>
                </div>
            </div>
            <div class="one-section">
                <p class="heading-one">Breif of Project</p>
                <div class="preview-box">
                </div>
                <div class="fund-button">
                    <a href="#">Fund</a>
                </div>
            </div>
            <div class="footer-section">
                <!--Put Column in here-->
            </div>
        </div>
    </body>
</body>
</html>
