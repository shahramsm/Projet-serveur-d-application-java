package offreService;

import ClassEnum.EtatService;
import entity.NatureService;
import entity.Notification;
import entity.Service;
import entity.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessions.NatureServiceFacadeLocal;
import sessions.NotificationFacadeLocal;
import sessions.ServiceFacadeLocal;
import sessions.UtilisateurFacadeLocal;

@WebServlet(name = "ServiceEdit", urlPatterns = {"/ServiceEdit"})
public class ServiceEdit extends HttpServlet {

    @EJB
    private NotificationFacadeLocal notificationFacade;

    @EJB
    private ServiceFacadeLocal serviceFacade;

    @EJB
    private NatureServiceFacadeLocal natureServiceFacade;

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;

    Service service = new Service();
Long id ;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Long.parseLong(request.getParameter("id"));

        List<NatureService> naturesServices = natureServiceFacade.findAll();
        request.setAttribute("naturesServices", naturesServices);
        service = serviceFacade.find(id);
        request.setAttribute("service", service);
        request.getRequestDispatcher("offreEdit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeService = request.getParameter("typeService");
        String user_id = request.getParameter("user_id");
        String nature = request.getParameter("nature");
        String idNatureService = request.getParameter("natureService");
        String dateDebutInString = request.getParameter("dateDebut");
        String dateFinInString = request.getParameter("dateFin");
        String courteDescription = request.getParameter("courteDescription");
        String longueDescription = request.getParameter("longueDescription");
        String pays = request.getParameter("pays");
        String ville = request.getParameter("ville");
        String cp = request.getParameter("cp");
        String localisation = pays + ", " + ville + ", " + cp;

        service.setCourteDescription(courteDescription);
        service.setDateDebut(new Date(dateDebutInString));
        service.setDateFin(new Date(dateFinInString)); 
        service.setLocalisation(localisation);
        service.setLongueDescription(longueDescription);

        NatureService ns = new NatureService();

        if (idNatureService == null) {
            ns.setDescription(nature);
            natureServiceFacade.create(ns);
        } else {

            ns = natureServiceFacade.find(Long.parseLong(idNatureService));

        }
        service.setNatureService(ns);
        service.setTypeService(typeService);

        Utilisateur user = new Utilisateur();
        user = utilisateurFacade.find(Long.parseLong(user_id));

        Utilisateur admin = utilisateurFacade.getAdmin();
        Notification notification = new Notification();

        if (service.getOffreService().equals("Offre de service")) {

            service.setOffreService("Offre de service");
            System.out.println("loggin::::" + user.getLogin());
            System.out.println("iddddservice:::::" + service.getId());
            notification.setMessage("L'utilisateur " + user.getLogin() + " a modifié l\'offre de service - ref: " + service.getId());

        }
        if (service.getOffreService().equals("Demande de service")) {

            service.setOffreService("Demande de service");
            // s.setDemandeUser(user);
            notification.setMessage("L'utilisateur " + user.getLogin() + " a modifié la demande de service- ref: " + service.getId());
        }
        notification.setEstLu(false);

        notification.setEmetteur(user);
        notification.setRecepteur(admin);
        notification.setDateNotif(new Date());
        serviceFacade.edit(service);
        notification.setService(service);
        notificationFacade.create(notification);
        utilisateurFacade.edit(user);
           response.sendRedirect("/ServeuAppJava-war/ServiceShowDetails?id=" +id);
         
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
