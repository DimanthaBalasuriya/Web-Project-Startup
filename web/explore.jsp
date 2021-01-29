<%-- 
    Document   : explore
    Created on : Jan 15, 2021, 9:44:16 PM
    Author     : CASSIE
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Startup.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/Style.css">
        <script src="js/main.js"></script>
        <title>Explore</title>
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
                    <div class="hero-intro">
                        <p class="hero-intro-title">See what we realize!</p>
                        <p class="hero-intro-story">Rocha admits to a preference of using specialist books over the internet when in these early research stages</p>
                    </div>
                </div>
            </div>
            <div class="one-section">
                <div class="explore-complete-project-area">                    
                    <p class="heading-one">Successpull project titles</p>
                    <div class="box-row">

                        <%
                            String id = "";
                            String title = "";
                            String description = "";
                            String state = "";
                            String link = "";
                            String price = "";

                            int count = 0;

                            try {
                                ResultSet rs = Database.getData("SELECT prg_id, prg_name, prg_description, prg_exp_fund, prg_curr_fund, use_id, prg_vid_link FROM Project WHERE prg_state = '1'");
                                while (rs.next()) {

                                    if (count == 8) {
                                        break;
                                    } else {
                                        count++;
                                    }

                                    double amountOne = rs.getDouble("prg_exp_fund");
                                    double amountTwo = rs.getDouble("prg_curr_fund");

                                    id = rs.getString("prg_id");
                                    title = rs.getString("prg_name");
                                    description = rs.getString("prg_description");
                                    link = rs.getString("prg_vid_link");
                                    price = rs.getString("prg_exp_fund");

                                    if (amountOne > amountTwo) {
                                        //Not complete project.
                                        continue;
                                    } else {
                                        //Complete project.
                                        state = "Complete";
                                    }

                        %>

                        <div class="box-column">
                            <div class="box-card">
                                <img src="img/img1.jpg" alt="Start Up" style="width: 100%">
                                <h1><% out.print(title); %></h1>
                                <p class="box-price"><% out.print(price); %></p>
                                <p class="box-price"><% out.print(state); %></p>
                                <p><% out.print(description);%></p>
                                <p><button><a href="project.jsp?id=<%=id%>">Fund</a></button></p>
                            </div>
                        </div>

                        <%                                                        }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>

                    </div>
                </div>
            </div>
            <div class="two-section">
                <div class="explore-pending-project-area">
                    <p class="heading-one">Start up project titles</p>
                    <div class="box-row">

                        <%
                            String pId = "";
                            String ptitle = "";
                            String pdescription = "";
                            String pstate = "";
                            String plink = "";
                            String pPrice = "";

                            int pCount = 0;

                            try {
                                ResultSet rs = Database.getData("SELECT prg_id, prg_name, prg_description, prg_exp_fund, prg_curr_fund, use_id, prg_vid_link FROM Project WHERE prg_state = '1'");
                                while (rs.next()) {

                                    if (pCount == 8) {
                                        break;
                                    } else {
                                        pCount++;
                                    }

                                    double amountOne = rs.getDouble("prg_exp_fund");
                                    double amountTwo = rs.getDouble("prg_curr_fund");

                                    pId = rs.getString("prg_id");
                                    ptitle = rs.getString("prg_name");
                                    pdescription = rs.getString("prg_description");
                                    plink = rs.getString("prg_vid_link");
                                    pPrice = rs.getString("prg_exp_fund") + " " + "$";

                                    if (amountOne > amountTwo) {
                                        //Not complete project.
                                        pstate = "Funding";
                                    } else {
                                        //Complete project.
                                        continue;
                                    }

                        %>

                        <div class="box-column">
                            <div class="box-card">
                                <img src="img/img1.jpg" alt="Start Up" style="width: 100%">
                                <h1><% out.print(title); %></h1>
                                <p class="box-price"><% out.print(pPrice); %></p>
                                <p class="box-price"><% out.print(state); %></p>
                                <p><% out.print(description);%></p>
                                <p><button><a href="project.jsp?id=<%=pId%>">Fund</a></button></p>
                            </div>
                        </div>

                        <%                                                        }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>

                    </div>
                </div>
            </div>
            <div class="footer-section">
                <!--Put Column in here-->
                <h1>Footer</h1>
            </div>
        </div>
    </body>
</body>
</html>


