/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import entity.Notification;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author user
 */
@Stateless
public class NotificationFacade extends AbstractFacade<Notification> implements NotificationFacadeLocal {

    @PersistenceContext(unitName = "DEFAULT_PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public NotificationFacade() {
        super(Notification.class);
    }

    @Override
    public void deleteNotifForEmetteur(Long idUser) {
        em.createQuery("DELETE  FROM  Notification n  WHERE  n.emetteur=" + idUser).executeUpdate();
    }

    @Override
    public void deleteNotifForRecepteur(Long idUser) {
        em.createQuery("DELETE  FROM  Notification n  WHERE  n.recepteur=" + idUser).executeUpdate();
    }

}
