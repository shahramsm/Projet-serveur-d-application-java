package offreService;

import entity.Notification;
import entity.Service;
import entity.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessions.NotificationFacadeLocal;
import sessions.ServiceFacadeLocal;
import sessions.UtilisateurFacadeLocal;

@WebServlet(name = "ServiceDelete", urlPatterns = {"/ServiceDelete"})
public class ServiceDelete extends HttpServlet {

    @EJB
    private NotificationFacadeLocal notificationFacade;

    @EJB
    private ServiceFacadeLocal serviceFacade;

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;

    Service service = new Service();
    Utilisateur utilisateur = new Utilisateur();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String idD = request.getParameter("idD");
        String id2 = request.getParameter("id2");

        utilisateur = utilisateurFacade.find(Long.parseLong(id2));
        
         if (idD == null) {
            service = serviceFacade.find(Long.parseLong(id));
             for (int i = 0; i < utilisateur.getOffres().size(); i++) {
                if (service.getId() == utilisateur.getOffres().get(i).getId()) {
                    System.out.println("aaaaaaaa:::::::::::" + utilisateur.getOffres().get(i));
                    utilisateur.getOffres().remove(utilisateur.getOffres().get(i));

                }
            }
        }
        if (idD != null) {
            service = serviceFacade.find(Long.parseLong(idD));
             for (int i = 0; i < utilisateur.getDemandes().size(); i++) {
                if (service.getId() == utilisateur.getDemandes().get(i).getId()) {
                    utilisateur.getDemandes().remove(utilisateur.getDemandes().get(i));

                }
            }
        }
      Utilisateur admin = utilisateurFacade.getAdmin();
        List<Notification> notifications = notificationFacade.findAll();
        for (int i = 0; i < notifications.size(); i++) {
            System.err.println("service" + service.getId());
            
          //  System.err.println("notif" + notifications.get(i).getService().getId());
            if (notifications.get(i).getService().getId() != null) {
                if (service.getId() == notifications.get(i).getService().getId()) {
                     admin.getNotifcationRecep().remove(notifications.get(i));
       utilisateurFacade.edit(admin);
                    notificationFacade.remove(notifications.get(i));

                }
            }
        } 
        serviceFacade.supprimerNotifsForService(service.getId());
       
       
        utilisateurFacade.edit(utilisateur);
        serviceFacade.remove(service);
          response.sendRedirect("/ServeuAppJava-war/ServiceShowByUser?id=" + id2 + "&&id2=3");
         
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
