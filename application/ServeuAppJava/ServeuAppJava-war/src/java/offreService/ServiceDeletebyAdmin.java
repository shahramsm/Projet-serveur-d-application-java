/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package offreService;

import ClassEnum.EtatService;
import ClassEnum.Mailer;
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

@WebServlet(name = "ServiceDeletebyAdmin", urlPatterns = {"/ServiceDeletebyAdmin"})
public class ServiceDeletebyAdmin extends HttpServlet {

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

        request.getRequestDispatcher("messageDelete.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = request.getParameter("message");
        Utilisateur admin = utilisateurFacade.getAdmin();
        Utilisateur utilisateur = new Utilisateur();
                

        service = serviceFacade.find(Long.parseLong(idString));

        Notification notification = new Notification();
        notification.setMessage(message);
        notification.setEstLu(false);

        notification.setDateNotif(new Date());

        notification.setService(serviceFacade.getServiceSupp());
        notification.setEmetteur(admin);
        String offreDem = service.getOffreService();
        if (service.getOffreService().equals("Offre de service")) {
            notification.setRecepteur(service.getOffreUser());
            utilisateur = service.getOffreUser();
            //Mailer.send(admin.getEmail(),service.getOffreUser().getEmail(), "Suppression de votre service - Rèf: " + service.getId(), message);
        }
        if (service.getOffreService().equals("Demande de service")) {
            notification.setRecepteur(service.getDemandeUser());
            utilisateur = service.getDemandeUser();
            //Mailer.send(admin.getEmail(), "Suppression de votre service - Rèf: " + service.getId(), service.getDemandeUser().getEmail(), message);
          
        }
        List<Notification> notifications = notificationFacade.findAll();
        for (int i = 0; i < notifications.size(); i++) {
            if (notifications.get(i).getService().getId() != null) {
                if (service.getId() == notifications.get(i).getService().getId()) {

                    notificationFacade.remove(notifications.get(i));

                }
            }
        }
        notificationFacade.create(notification);
        utilisateur.getNotifcationRecep().add(notification);
        utilisateurFacade.edit(utilisateur);

        serviceFacade.supprimerNotifsForService(service.getId());
        serviceFacade.remove(service);

        if (offreDem.equals("Offre de service")) {
            response.sendRedirect("/ServeuAppJava-war/ServicesShow");
        }
        if (offreDem.equals("Demande de service")) {
            response.sendRedirect("/ServeuAppJava-war/ServicesShow?id2=2");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
