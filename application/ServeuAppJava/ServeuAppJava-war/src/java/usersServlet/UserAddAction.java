package usersServlet;

import entity.Utilisateur;
import java.io.IOException;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import sessions.UtilisateurFacadeLocal;

@WebServlet(name = "UserAddAction", urlPatterns = {"/UserAddAction"})
public class UserAddAction extends HttpServlet {

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;
    Boolean reponse = false;
    Boolean loginvalidation = false;
    Utilisateur utilisateur = new Utilisateur();
    List valeurs = new ArrayList();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("rep", reponse);
        request.setAttribute("loginvalidation", loginvalidation);
        reponse = false;
        loginvalidation = false;
        request.getRequestDispatcher("userAdd.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String login = request.getParameter("pseudonyme");
        String dateInString;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        dateInString = request.getParameter("dn");

        String sexe = request.getParameter("sexe");
        String tel = request.getParameter("tel");
        String pays = request.getParameter("pays");
        String ville = request.getParameter("ville");
        String cp = request.getParameter("cp");
        String adresse = pays + "," + ville + "," + cp;
        String email = request.getParameter("email");
        String mdp = null;
        try {
            mdp = generateStrongPasswordHash(request.getParameter("password"));
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserAddAction.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeySpecException ex) {
            Logger.getLogger(UserAddAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        String description = request.getParameter("description");

        Utilisateur u = new Utilisateur();
        u.setNom(nom);
        u.setPrenom(prenom);
        u.setLogin(login);
        u.setMdp(mdp);
        u.setEmail(email);
        u.setAdresse(adresse);
        u.setTel(tel);
        u.setDescription(description);
        u.setDateNaissance(new Date(dateInString));
        u.setSexe("Masculin");

        utilisateur = utilisateurFacade.getUtilisateurByMail(email);
        if (utilisateur == null) {
            utilisateurFacade.create(u);
            u = null;
            valeurs.clear();
            request.setAttribute("rep", reponse);
            request.setAttribute("loginvalidation", loginvalidation);
            reponse = true;
            loginvalidation = false;
            response.sendRedirect("/ServeuAppJava-war/UserAddAction");

        } else {
            request.setAttribute("valeurs", valeurs);
            request.setAttribute("rep", reponse);
            reponse = false;
            loginvalidation = true;
            request.setAttribute("loginvalidation", loginvalidation);
            request.getRequestDispatcher("userAdd.jsp").forward(request, response);

        }
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
