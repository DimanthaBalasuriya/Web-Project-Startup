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
@WebServlet(name = "Campaing", urlPatterns = {"/Campaing"})
public class Campaing extends HttpServlet {

    private String title;
    private String category;
    private String description;
    private String ambition;
    private String future;
    private String explanation;
    private String projectVidLink;
    private Double expFundPrice;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            title = req.getParameter("title");
            category = req.getParameter("category");
            description = req.getParameter("description");
            ambition = req.getParameter("ambition");
            future = req.getParameter("future");
            explanation = req.getParameter("explanation");
            projectVidLink = req.getParameter("video");
            expFundPrice = Double.parseDouble(req.getParameter("expFundPrice"));
            HttpSession ses = req.getSession();
            Database.sendData("INSERT INTO project (prg_name, prg_description, prg_ambition, prg_explanation, prg_future, prg_exp_fund, use_id, prg_category, prg_vid_link) "
                    + "VALUES('" + title + "', '" + description + "', '" + ambition + "', '" + explanation + "', '" + future + "', '" + expFundPrice + "', '" + ses.getValue("id") + "', '" + category + "', '" + projectVidLink + "')"
            );
            resp.sendRedirect(req.getContextPath() + "/Index");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/campaing.jsp").include(req, resp);
    }

}
