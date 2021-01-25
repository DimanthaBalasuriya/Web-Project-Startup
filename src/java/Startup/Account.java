/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Startup;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Account", urlPatterns = {"/Account"})
public class Account extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession ses = req.getSession();
        if (ses.getValue("id") == null) {
            req.getRequestDispatcher("/index.jsp").include(req, resp);
        } else {
            req.getRequestDispatcher("/account.jsp").include(req, resp);
        }
    }

}
