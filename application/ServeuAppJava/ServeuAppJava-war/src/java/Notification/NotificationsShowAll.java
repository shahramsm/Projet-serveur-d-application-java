/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Notification;

import entity.Notification;
import entity.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessions.NotificationFacadeLocal;
import sessions.UtilisateurFacadeLocal;


 
@WebServlet(name = "NotificationsShowAll", urlPatterns = {"/NotificationsShowAll"})
public class NotificationsShowAll extends HttpServlet {

    @EJB
    private NotificationFacadeLocal notificationFacade;
    
    
    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;
   
    Notification notification = new Notification();
    Utilisateur utilisateur =new Utilisateur();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
         Long id = Long.parseLong(request.getParameter("id"));
         utilisateur = utilisateurFacade.find(id);
          List<Notification> notifications= utilisateur.getNotifcationRecep();
        request.setAttribute("notifications", notifications);
        
        request.getRequestDispatcher("notificationShowAll.jsp").forward(request, response);
         
    }

  
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
