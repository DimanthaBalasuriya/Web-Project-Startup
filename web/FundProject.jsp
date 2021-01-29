<%-- 
    Document   : FundProject
    Created on : Jan 26, 2021, 9:11:26 AM
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
                <div class="fund-content">
                    <div class="funding-area">
                        <div class="heading-one">
                            How You Fund For THis.
                        </div>
                        <div class="funding-input-area">
                            <%
                                String pid = request.getParameter("id");
                                request.setAttribute("progID", pid);
                            %>
                            <form method="GET" action="FundProject">
                                <input type="hidden" value="<%=pid%>" name="progID">
                                <input type="number" name="fundAmount" placeholder="Amount you fund" onkeypress="limitKeypress(event, this.value, 4)" class="text-input"/>
                                <input type="submit" value="Start it now" class="start-it-button"/>
                            </form>
                        </div>
                    </div>
                    <div class="funding-project-area">
                        <div class="box-row">
                            <%
                                String title = "";
                                String description = "";
                                String state = "";
                                String link = "";
                                String id = "";
                                String price = "";

                                try {
                                    ResultSet rs = Database.getData("SELECT prg_id, prg_name, prg_description, prg_exp_fund, prg_curr_fund, use_id, prg_vid_link FROM Project WHERE prg_id = '1' AND prg_state = '1'");
                                    if (rs.next()) {
                                        double amountOne = rs.getDouble("prg_exp_fund");
                                        double amountTwo = rs.getDouble("prg_curr_fund");

                                        title = rs.getString("prg_name");
                                        description = rs.getString("prg_description");
                                        link = rs.getString("prg_vid_link");
                                        id = rs.getString("prg_id");
                                        price = rs.getString("prg_exp_fund");

                                        if (amountOne > amountTwo) {
                                            //Not complete project.
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
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
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
