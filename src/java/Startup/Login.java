/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Startup;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CASSIE
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    private String username;
    private String password;
    private String date;
    private String time;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").include(req, resp);
        username = req.getParameter("username");
        password = req.getParameter("password");

        try {
            ResultSet rs = Database.getData("SELECT use_id FROM user WHERE use_username = '" + username + "' AND use_password = '" + password + "'");
            if (rs.next()) {
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss");
                Database.sendData("INSERT INTO login_history (lgh_time, lgh_date, use_id) VALUES('" + sdf2.format(new Date()) + "','" + sdf1.format(new Date()) + "','" + rs.getInt("use_id") + "')");
                HttpSession ses = req.getSession();
                ses.putValue("id", rs.getInt("use_id"));
                //resp.sendRedirect(req.getContextPath() + "/Account");
            } else {
                //Show Error Page
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
