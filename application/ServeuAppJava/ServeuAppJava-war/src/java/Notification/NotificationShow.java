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
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessions.NotificationFacadeLocal;
import sessions.UtilisateurFacadeLocal;



@WebServlet(name = "NotificationShow", urlPatterns = {"/NotificationShow"})
public class NotificationShow extends HttpServlet {

    @EJB
    private NotificationFacadeLocal notificationFacade;
    
    
    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;
   
    Notification notification = new Notification();

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        String idString = request.getParameter("id2");
        notification=notificationFacade.find(Long.parseLong(id));
        notification.setEstLu(true);
        notificationFacade.edit(notification);
        request.setAttribute("notification", notification);
        HttpSession session = request.getSession();
        session.removeAttribute("user"); 
        if (idString != null) {
            Long id2 = Long.parseLong(idString);
            Utilisateur utilisateur = utilisateurFacade.find(id2);
            session.setAttribute("user", utilisateur); 
        }
        
        request.getRequestDispatcher("notificationShow.jsp").forward(request, response);
        
    }
 
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    

}
