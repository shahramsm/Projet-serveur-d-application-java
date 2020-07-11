/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package offreService;

import ClassEnum.EtatService;
import entity.Notification;
import entity.Service;
import entity.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessions.NotificationFacadeLocal;
import sessions.ServiceFacadeLocal;
import sessions.UtilisateurFacadeLocal;

@WebServlet(name = "ServicePropositionAction", urlPatterns = {"/ServicePropositionAction"})
public class ServicePropositionAction extends HttpServlet {

    @EJB
    private NotificationFacadeLocal notificationFacade;

    @EJB
    private ServiceFacadeLocal serviceFacade;

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;
    Service service = new Service();

    Boolean reponse = false;
    Boolean loginvalidation = false;
    List valeurs = new ArrayList();
    String idString;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        idString = request.getParameter("id");

        request.setAttribute("rep", reponse);
        request.setAttribute("loginvalidation", loginvalidation);
        reponse = false;
        loginvalidation = false;
        request.getRequestDispatcher("messageProposition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = request.getParameter("message");
        String user_id = request.getParameter("user_id");
        Utilisateur utilisateur = new Utilisateur();
        utilisateur = utilisateurFacade.find(Long.parseLong(user_id));

        service = serviceFacade.find(Long.parseLong(idString));
        if (!service.getEtat().equals(EtatService.EN_COURS.toString())) {
            Notification notification = new Notification();
            Notification notification2 = new Notification();
            notification.setMessage(message);
            notification2.setMessage("Ci joint les coordonnées du créateur de service");
            notification.setEstLu(false);
            notification2.setEstLu(false);
            notification.setService(service);
            notification2.setService(service);
            service.setEtat(EtatService.EN_COURS.toString()); 
            serviceFacade.edit(service);
            notification.setEmetteur(utilisateur);
            notification2.setRecepteur(utilisateur);
            notification.setDateNotif(new Date());
            notification2.setDateNotif(new Date());
            if(service.getOffreUser() !=null){
            notification.setRecepteur(service.getOffreUser());
            notification2.setEmetteur(service.getOffreUser());
            notificationFacade.create(notification);
            notificationFacade.create(notification2);
            service.getOffreUser().getNotifcationRecep().add(notification2);
            utilisateurFacade.edit(service.getOffreUser());
            }
            if(service.getDemandeUser()!=null){
            notification.setRecepteur(service.getDemandeUser());
            notification2.setEmetteur(service.getDemandeUser());
            notificationFacade.create(notification);
            notificationFacade.create(notification2);
            service.getDemandeUser().getNotifcationRecep().add(notification);
            utilisateurFacade.edit(service.getDemandeUser());
            }
            utilisateur.getNotifcationRecep().add(notification2);
            utilisateurFacade.edit(utilisateur);
            reponse = true;
            loginvalidation = false;
            request.setAttribute("rep", reponse);
            request.setAttribute("loginvalidation", loginvalidation);

            response.sendRedirect("/ServeuAppJava-war/ServicePropositionAction?id=" + service.getId());

        } else {
            request.setAttribute("valeurs", valeurs);
            request.setAttribute("rep", reponse);
            request.setAttribute("loginvalidation", loginvalidation);
            reponse = false;
            loginvalidation = true;
             response.sendRedirect("/ServeuAppJava-war/ServicePropositionAction?id=" + service.getId());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
