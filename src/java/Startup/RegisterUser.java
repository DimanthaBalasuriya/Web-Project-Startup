/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Startup;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
@WebServlet(name = "RegisterUser", urlPatterns = {"/RegisterUser"})
public class RegisterUser extends HttpServlet {

    private String name;
    private String username;
    private String dob;
    private String contactno;
    private String country;
    private String password;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").include(req, resp);
        try {
            name = req.getParameter("name");
            username = req.getParameter("username");
            dob = req.getParameter("dob");
            contactno = req.getParameter("contact");
            country = req.getParameter("country");
            password = req.getParameter("password");

            Database.sendData("INSERT INTO User(use_name, use_email, use_dob, use_contact_no, use_country, use_username, use_password)"
                    + " VALUES ('" + name + "', '" + username + "', '" + dob + "', '" + contactno + "', '" + country + "', '" + username + "', '" + password + "')");
            //Create session
            int uCount = 0;
            ResultSet rs1 = Database.getData("SELECT COUNT(use_id) as c FROM User");
            if (rs1.next()) {
                uCount = rs1.getInt("c");
            }
            HttpSession ses = req.getSession();
            ses.putValue("id", uCount);
            req.getRequestDispatcher("/account.jsp").include(req, resp);
            //Redirect to the account page
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
