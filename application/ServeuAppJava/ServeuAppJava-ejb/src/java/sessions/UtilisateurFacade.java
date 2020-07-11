/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import entity.Utilisateur;
import java.util.Iterator;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author user
 */
@Stateless
public class UtilisateurFacade extends AbstractFacade<Utilisateur> implements UtilisateurFacadeLocal {

    @PersistenceContext(unitName = "DEFAULT_PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UtilisateurFacade() {
        super(Utilisateur.class);
    }
    @Override
      public Utilisateur getUtilisateurByMail(String email) {

        Utilisateur u = null;
        List<Utilisateur> users = em.createQuery("SELECT u FROM Utilisateur u WHERE  u.email ='" + email +  "'").getResultList();
        for (Iterator iter = users.iterator(); iter.hasNext();) {
            // récupérer l'utilisateur trouvé par son login  et son mot de passe
            u = (Utilisateur) iter.next();
        }

        return u;

    }
    @Override
        public Utilisateur getUtilisateurByMailPassword(String email, String password) {

		Utilisateur u =null;
		      List<Utilisateur> users =em.createQuery("SELECT u FROM Utilisateur u WHERE  u.email ='"+email+"'  and u.mdp ='"+password+"'").getResultList();
		for (Iterator iter = users.iterator(); iter.hasNext();) 
		{
			// récupérer l'utilisateur trouvé par son login  et son mot de passe
			 u = (Utilisateur) iter.next();					
		}
		
		return u;
		
	}
    @Override
        public Utilisateur getAdmin() {

		Utilisateur u =null;
		      List<Utilisateur> users =em.createQuery("SELECT u FROM Utilisateur u WHERE  u.estAdmin='1'").getResultList();
		for (Iterator iter = users.iterator(); iter.hasNext();) 
		{
			// récupérer l'utilisateur trouvé par son login  et son mot de passe
			 u = (Utilisateur) iter.next();					
		}
		
		return u;
		
	}
}
