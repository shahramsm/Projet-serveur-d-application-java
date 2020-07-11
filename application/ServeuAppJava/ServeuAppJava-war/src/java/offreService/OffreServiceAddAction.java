package offreService;

import ClassEnum.EtatService;
import entity.NatureService;
import entity.Notification;
import entity.Service;
import entity.Utilisateur;
import java.io.IOException;
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

/**
 *
 * @author user
 */
@WebServlet(name = "OffreServiceAddAction", urlPatterns = {"/OffreServiceAddAction"})
public class OffreServiceAddAction extends HttpServlet {

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;

    @EJB
    private ServiceFacadeLocal serviceFacade;

    @EJB
    private NatureServiceFacadeLocal natureServiceFacade;

    @EJB
    private NotificationFacadeLocal notificationFacade;

    String query;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        query = request.getQueryString();
        System.out.println("query:::::::::::" + query);
        List<NatureService> naturesServices = natureServiceFacade.findAll();
        request.setAttribute("naturesServices", naturesServices);
        request.getRequestDispatcher("offreAdd.jsp").forward(request, response);
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
        String localisation = pays + "," + ville + "," + cp;

        Service s = new Service();

        s.setCourteDescription(courteDescription);
        s.setDateDebut(new Date(dateDebutInString));
        s.setDateFin(new Date(dateFinInString));
        s.setEtat(EtatService.A_VALIDER.toString());
        s.setLocalisation(localisation);
        s.setLongueDescription(longueDescription);

        NatureService ns = new NatureService();

        if (idNatureService == null) {
            ns.setDescription(nature);
            natureServiceFacade.create(ns);
        } else {

            ns = natureServiceFacade.find(Long.parseLong(idNatureService));

        }
        s.setNatureService(ns);
        s.setTypeService(typeService);

        Utilisateur user = new Utilisateur();
        user = utilisateurFacade.find(Long.parseLong(user_id));

        Utilisateur admin = utilisateurFacade.getAdmin();
        Notification notification = new Notification();

        if (query != null) {
            user.getOffres().add(s);
            s.setOffreUser(user);
            s.setOffreService("Offre de service");
            notification.setMessage("L'utilisateur " + user.getLogin() + " a créé une nouvelle offre de service");

        }
        if (query == null) {
            user.getDemandes().add(s);
            s.setOffreService("Demande de service");
           s.setDemandeUser(user);
            notification.setMessage("L'utilisateur " + user.getLogin() + " a créé une nouvelle demande de service");
        }
        notification.setEstLu(false);
        
        notification.setEmetteur(user);
        notification.setRecepteur(admin);
        notification.setDateNotif(new Date());
        notificationFacade.create(notification);
        admin.getNotifcationRecep().add(notification);
        //s.getNotifications().add(notification);
        serviceFacade.create(s);
        notification.setService(s);
        notificationFacade.edit(notification);
        utilisateurFacade.edit(user);
        utilisateurFacade.edit(admin);

        response.sendRedirect("/ServeuAppJava-war/OffreServiceAddAction");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
