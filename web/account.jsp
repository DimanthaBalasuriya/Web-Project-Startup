<%-- 
    Document   : account
    Created on : Jan 16, 2021, 2:55:12 PM
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
                <div class="account-content">
                    <div class="account-area">
                        <p class="heading-one">Account details</p>
                        <a href="${pageContext.request.contextPath}/Logout">Log out</a>
                    </div>
                    <%
                        HttpSession ses = request.getSession();
                        String uid = ses.getValue("id").toString();

                        String name = "";
                        String username = "";
                        String dob = "";
                        String country = "";
                        String contactNo = "";
                        String password = "";

                        ResultSet rs = Database.getData("SELECT use_name, use_email, use_dob, use_contact_no, use_country, use_password FROM User WHERE use_id = '" + uid + "'");
                        if (rs.next()) {
                            name = rs.getString("use_name");
                            username = rs.getString("use_email");
                            dob = rs.getString("use_dob");
                            country = rs.getString("use_country");
                            contactNo = rs.getString("use_contact_no");
                            password = rs.getString("use_password");
                        }

                    %>
                    <div class="info-section">
                        <div class="input-item-section">
                            <div class="input-item-section-item">
                                <div class="hero-text">
                                    Name
                                </div>
                                <input type="text" placeholder="Name" value="<%=name%>">
                            </div>
                            <div class="input-item-section-item">
                                <div class="hero-text">
                                    Contact no
                                </div>
                                <input type="text" placeholder="Name" value="<%=contactNo%>">
                            </div>
                            <div class="input-item-section-item">
                                <div class="hero-text">
                                    Birthday
                                </div>
                                <input type="text" placeholder="Name" value="<%=dob%>">
                            </div>
                            <div class="input-item-section-item">
                                <div class="hero-text">
                                    Country
                                </div>
                                <input type="text" placeholder="Name" value="<%=country%>">
                            </div>
                            <div class="input-item-section-item">
                                <div class="hero-text">
                                    Email
                                </div>
                                <input type="text" placeholder="Name" value="<%=username%>">
                            </div>
                        </div>
                        <div class="input-item-section">
                            <div class="input-item-section-item">
                                <div class="hero-text">
                                    Password
                                </div>
                                <input type="text" placeholder="Name" value="<%=password%>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="one-section">
                <div class="activity-content">
                    <p class="heading-one">Your Activities</p>
                    <div class="user-project-area">
                        <div class="your-project">
                            <!-- your table here -->
                            <p class="heading-one">Campained projects</p>
                            <!-- prg_name, prg_category, prg_exp_fund, prg_curr_fund -->
                            <div class="table-area">
                                <table border="1">
                                    <thead><th>Name</th><th>Category</th><th>Fund</th><td>Total</td></thead>
                                        <%
                                            String pname = "";
                                            String category = "";
                                            String expFund = "";
                                            String currFund = "";

                                            ResultSet rs1 = Database.getData("SELECT prg_name, prg_category, prg_exp_fund, prg_curr_fund FROM Project WHERE use_id = '" + 1 + "' ");
                                            while (rs1.next()) {
                                                pname = rs1.getString("prg_name");
                                                category = rs1.getString("prg_category");
                                                expFund = rs1.getString("prg_exp_fund");
                                                currFund = rs1.getString("prg_curr_fund");
                                                out.print("<tr><td>" + pname + "</td><td>" + category + "</td><td>" + expFund + "</td><td>" + currFund + "</td></tr>");
                                            }
                                        %>
                                </table>
                            </div>
                        </div>
                        <div class="invested-project">
                            <!-- your investments here -->
                            <p class="heading-one">Invested Projects</p>
                            <!-- prg_name, prg_category, prg_description, prg_exp_fund -->
                            <div class="table-area">
                                <table border="1">
                                    <thead><th>Name</th><th>Category</th><th>Description</th><td>Fund</td></thead>
                                        <%
                                            String ppname = "";
                                            String pcategory = "";
                                            String pexpFund = "";
                                            String pcurrFund = "";

                                            ResultSet rs2 = Database.getData("SELECT `project`.`prg_name`, `project`.`prg_description`, `project`.`prg_exp_fund`, `project`.`prg_category` FROM `start_up_proj`.`project` INNER JOIN `start_up_proj`.`user` ON (`project`.`use_id` = `user`.`use_id`) INNER JOIN `start_up_proj`.`user_project_state` ON (`user_project_state`.`prg_id` = `project`.`prg_id`) AND (`user_project_state`.`use_id` = `user`.`use_id`) WHERE user.`use_id` = '" + 1 + "'");
                                            while (rs2.next()) {
                                                ppname = rs2.getString("prg_name");
                                                pcategory = rs2.getString("prg_category");
                                                pexpFund = rs2.getString("prg_description");
                                                pcurrFund = rs2.getString("prg_exp_fund");
                                                out.print("<tr><td>" + ppname + "</td><td>" + pcategory + "</td><td>" + pexpFund + "</td><td>" + pcurrFund + "</td></tr>");
                                            }
                                        %>
                                </table>
                            </div>
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