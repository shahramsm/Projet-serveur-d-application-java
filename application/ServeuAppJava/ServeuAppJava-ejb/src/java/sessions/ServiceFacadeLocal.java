/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import entity.Service;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author user
 */
@Local
public interface ServiceFacadeLocal {

    void create(Service service);

    void edit(Service service);

    void remove(Service service);

    Service find(Object id);

    List<Service> findAll();

    List<Service> findRange(int[] range);

    int count();

    public void supprimerNotifsForService(long idService);

    public Service getServiceSupp();

    public List<Service> getAllServicesbyUser(Long idUser);
    
    public void deleteServicesForUser(Long idUser);
    
    public void deleteOffresForUser(Long idUser);
    
    public void checkServiceObsolete();
    
}
