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

/**
 *
 * @author CASSIE
 */
@WebServlet(name = "FundProject", urlPatterns = {"/FundProject"})
public class FundProject extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("progID");
            double fundAmount = Double.parseDouble(req.getParameter("fundAmount"));
            ResultSet rs1 = Database.getData("SELECT prg_curr_fund FROM Project WHERE prg_id = '" + id + "'");
            if (rs1.next()) {
                double newAmount = rs1.getDouble("prg_curr_fund") + fundAmount;
                Database.sendData("UPDATE Project SET prg_curr_fund = '" + newAmount + "' WHERE prg_id = '" + id + "'");
                req.getRequestDispatcher("/explore.jsp").include(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
