/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package usersServlet;

import entity.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
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
@WebServlet(name = "UserEditAction", urlPatterns = {"/UserEditAction"})
public class UserEditAction extends HttpServlet {

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;
    Utilisateur u = new Utilisateur();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("user_id"));
        u = utilisateurFacade.find(id);
        String pseudonyme = request.getParameter("pseudonyme");
        String mdp = null;
        try {
            mdp = generateStrongPasswordHash(request.getParameter("password"));
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserAddAction.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeySpecException ex) {
            Logger.getLogger(UserAddAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        String pays = request.getParameter("pays");
        String ville = request.getParameter("ville");
        String cp = request.getParameter("cp");
        String adresse = pays + ", " + ville + ", " + cp;
        String tel = request.getParameter("tel");
        String description = request.getParameter("description");
        u.setLogin(pseudonyme);
        if (mdp != null) {
            u.setMdp(mdp);
        }
        u.setAdresse(adresse);
        u.setTel(tel);
        u.setDescription(description);
        utilisateurFacade.edit(u);
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        if (id != null) {

            Utilisateur utilisateur = utilisateurFacade.find(id);
            session.setAttribute("user", utilisateur);
        }
        response.sendRedirect("UserEditAction?id=" + id);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static String generateStrongPasswordHash(String password) throws NoSuchAlgorithmException, InvalidKeySpecException {
        int iterations = 1000;
        char[] chars = password.toCharArray();
        byte[] salt = getSalt();

        PBEKeySpec spec = new PBEKeySpec(chars, salt, iterations, 64 * 8);
        SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        byte[] hash = skf.generateSecret(spec).getEncoded();
        return iterations + ":" + toHex(salt) + ":" + toHex(hash);
    }

    private static byte[] getSalt() throws NoSuchAlgorithmException {
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return salt;
    }

    private static String toHex(byte[] array) throws NoSuchAlgorithmException {
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length * 2) - hex.length();
        if (paddingLength > 0) {
            return String.format("%0" + paddingLength + "d", 0) + hex;
        } else {
            return hex;
        }
    }
}
