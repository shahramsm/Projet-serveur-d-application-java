package ConnexionServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import entity.Utilisateur;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessions.UtilisateurFacadeLocal;

/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/ActualiserAction"})
public class ActualiserAction extends HttpServlet {

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        String idString = (String) request.getParameter("id");
        if (idString != null) {
            Long id = Long.parseLong(idString);
            Utilisateur utilisateur = utilisateurFacade.find(id);
            session.setAttribute("user", utilisateur);
            response.sendRedirect("/ServeuAppJava-war/UserEditAction?id=" + id);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
