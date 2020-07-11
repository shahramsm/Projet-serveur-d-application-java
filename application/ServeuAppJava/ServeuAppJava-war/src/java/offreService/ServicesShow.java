/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package offreService;

import entity.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessions.ServiceFacadeLocal;

 
@WebServlet(name = "ServicesShow", urlPatterns = {"/ServicesShow"})
public class ServicesShow extends HttpServlet {

    @EJB
    private ServiceFacadeLocal serviceFacade;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id2 = request.getParameter("id2");
        request.setAttribute("id2", id2);
        List<Service> services=serviceFacade.findAll();
        List<Service> demandes = new Vector();
        List<Service> offres = new Vector();
        for (int i = 0; i < services.size(); i++) {
            if(services.get(i).getOffreService().equals("Demande de service")){
                demandes.add(services.get(i));
        request.setAttribute("demandes", demandes);
            }
            if(services.get(i).getOffreService().equals("Offre de service")){
                offres.add(services.get(i));
        request.setAttribute("offres", offres);
            }
            
        }
         
        request.getRequestDispatcher("offresShow.jsp").forward(request, response);
    }
 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
