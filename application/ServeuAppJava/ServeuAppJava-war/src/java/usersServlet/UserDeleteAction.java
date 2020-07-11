/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package usersServlet;

import entity.Notification;
import entity.Service;
import entity.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialArray;
import sessions.NotificationFacadeLocal;
import sessions.ServiceFacadeLocal;
import sessions.UtilisateurFacadeLocal;

/**
 *
 * @author user
 */
@WebServlet(name = "UserDeleteAction", urlPatterns = {"/UserDeleteAction"})
public class UserDeleteAction extends HttpServlet {

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;
    @EJB
    private ServiceFacadeLocal serviceFacade;
    @EJB
    private NotificationFacadeLocal notificationFacade;
    Utilisateur utilisateur = new Utilisateur();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));

        utilisateur = utilisateurFacade.find(id);

        utilisateurFacade.remove(utilisateur);

        response.sendRedirect("/ServeuAppJava-war/Deconnexion");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
