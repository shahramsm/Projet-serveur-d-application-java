/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package offreService;

import entity.NatureService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessions.NatureServiceFacadeLocal;

/**
 *
 * @author user
 */
@WebServlet(name = "NatureServiceAddAction", urlPatterns = {"/NatureServiceAddAction"})
public class NatureServiceAddAction extends HttpServlet {

    @EJB
    private NatureServiceFacadeLocal natureServiceFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getRequestDispatcher("service/addNatureService.jsp").forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String natureService = request.getParameter("description");

        NatureService ns = new NatureService();
        ns.setDescription(natureService);
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        natureServiceFacade.create(ns);
        response.sendRedirect("/SAJProject-war/OffreServiceAddAction");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
