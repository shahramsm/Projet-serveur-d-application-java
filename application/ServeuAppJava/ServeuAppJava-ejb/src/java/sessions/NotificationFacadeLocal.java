/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import entity.Notification;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author user
 */
@Local
public interface NotificationFacadeLocal {

    void create(Notification notification);

    void edit(Notification notification);

    void remove(Notification notification);

    Notification find(Object id);

    List<Notification> findAll();

    List<Notification> findRange(int[] range);

    int count();
    
    public void deleteNotifForEmetteur(Long idUser) ;
    
    public void deleteNotifForRecepteur(Long idUser) ;
    
}
