/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import ClassEnum.EtatService;
import entity.Service;
import java.time.LocalDate;
import java.util.Iterator;
import java.util.List;
import javax.ejb.Schedule;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author user
 */
@Stateless
public class ServiceFacade extends AbstractFacade<Service> implements ServiceFacadeLocal {

    @PersistenceContext(unitName = "DEFAULT_PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ServiceFacade() {
        super(Service.class);
    }

    public void supprimerNotifsForService(long idService) {
        Service service = em.find(Service.class, idService);
        service.getNotifications().clear();
    }

    @Override
    public Service getServiceSupp() {

        Service s = null;
        List<Service> users = em.createQuery("SELECT s FROM Service s WHERE  s.courteDescription='ServiceSupp'").getResultList();
        for (Iterator iter = users.iterator(); iter.hasNext();) {
            // récupérer l'utilisateur trouvé par son login  et son mot de passe
            s = (Service) iter.next();
        }

        return s;

    }

    public List<Service> getAllServicesbyUser(Long idUser) {

        List<Service> services = em.createQuery("SELECT s FROM Service s WHERE    (s.demandeUser='"+idUser+"' AND s.offreUser IS NULL ) OR (s.offreUser = '"+ idUser+"' AND s.demandeUser IS NULL)").getResultList();

        return services;

    }

    @Override
    public void deleteServicesForUser(Long idUser) {
    em.createQuery("DELETE  FROM  Service s  WHERE  s.demandeUser="+idUser).executeUpdate();
    }

    @Override
    public void deleteOffresForUser(Long idUser) {

        em.createQuery("DELETE  FROM  Service s  WHERE  s.offreUser="+idUser).executeUpdate();
   
    }
 
    @Schedule(second = "0", minute = "0", hour = "0", dayOfWeek = "*", dayOfMonth = "*", month = "*", year = "*", info = "myTimer2")
    @Override
    public void checkServiceObsolete() {
        LocalDate localDate = LocalDate.now();
        em.createQuery("UPDATE Service s SET s.etat = '" + EtatService.OBSOLETE + "' WHERE s.etat != '" + EtatService.OBSOLETE + "' AND s.dateFin < '" + localDate + "'").executeUpdate();
    }

}
