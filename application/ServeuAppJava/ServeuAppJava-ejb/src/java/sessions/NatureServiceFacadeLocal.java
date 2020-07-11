/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import entity.NatureService;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author user
 */
@Local
public interface NatureServiceFacadeLocal {

    void create(NatureService natureService);

    void edit(NatureService natureService);

    void remove(NatureService natureService);

    NatureService find(Object id);

    List<NatureService> findAll();

    List<NatureService> findRange(int[] range);

    int count();
    
}
