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
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessions.NotificationFacadeLocal;
import sessions.ServiceFacadeLocal;
import sessions.UtilisateurFacadeLocal;

@WebServlet(name = "ServiceAccept", urlPatterns = {"/ServiceAccept"})
public class ServiceAccept extends HttpServlet {

    @EJB
    private ServiceFacadeLocal serviceFacade;

    @EJB
    private NotificationFacadeLocal notificationFacade;

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Service service = new Service();
        service = serviceFacade.find(id);
        service.setEtat(EtatService.VALIDE.toString());
        serviceFacade.edit(service);
        Notification notification = new Notification();
        notification.setEstLu(false);
        notification.setDateNotif(new Date());
        notification.setService(service);
        Utilisateur admin = utilisateurFacade.getAdmin();
        notification.setEmetteur(admin);

        if (service.getOffreService().equals("Offre de service")) {
            notification.setRecepteur(service.getOffreUser());
            notification.setMessage("Votre offre de service a été accepté par l'administrateur du site");
            notificationFacade.create(notification);
            Utilisateur user = utilisateurFacade.find(service.getOffreUser().getCodeUtilisateur());
            user.getNotifcationRecep().add(notification);
            utilisateurFacade.edit(user);
            response.sendRedirect("/ServeuAppJava-war/ServicesShow");
        }
        if (service.getOffreService().equals("Demande de service")) {
            notification.setRecepteur(service.getDemandeUser());
            notification.setMessage("Votre demande de service a été accepté par l'administrateur du site");
            notificationFacade.create(notification);
            Utilisateur user = utilisateurFacade.find(service.getDemandeUser().getCodeUtilisateur());
            user.getNotifcationRecep().add(notification);
            utilisateurFacade.edit(user);
            response.sendRedirect("/ServeuAppJava-war/ServicesShow?id2=2");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
