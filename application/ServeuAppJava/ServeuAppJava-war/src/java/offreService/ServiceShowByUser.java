/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package offreService;

import entity.Service;
import entity.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessions.ServiceFacadeLocal;
import sessions.UtilisateurFacadeLocal;

/**
 *
 * @author user
 */
@WebServlet(name = "ServiceShowByUser", urlPatterns = {"/ServiceShowByUser"})
public class ServiceShowByUser extends HttpServlet {

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;

    
    @EJB
    private ServiceFacadeLocal serviceFacade;
    
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Long id = Long.parseLong(request.getParameter("id"));
        String id2 = request.getParameter("id2");
        request.setAttribute("id2", id2); 
         Utilisateur utilisateur = new Utilisateur();
         utilisateur = utilisateurFacade.find(id);
         
         List<Service> services= utilisateur.getOffres();
        request.setAttribute("services", services); 
        
        List<Service> demandes= utilisateur.getDemandes();
        request.setAttribute("demandes", demandes);
        List<Service> all = serviceFacade.findAll();
        List<Service> allSer = new ArrayList<>();
            
        for (int i = 0; i < all.size(); i++) {
           if((all.get(i).getDemandeUser() != null && all.get(i).getDemandeUser().getCodeUtilisateur()== id)
               || (all.get(i).getOffreUser()!= null && all.get(i).getOffreUser().getCodeUtilisateur()== id))    
                allSer.add(all.get(i));
             
        }
        request.setAttribute("all", allSer);
        
        request.getRequestDispatcher("offresShowByUser.jsp").forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
