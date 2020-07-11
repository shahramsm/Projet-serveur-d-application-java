package ConnexionServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import entity.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessions.UtilisateurFacadeLocal;

import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/ConnexionAction"})
public class ConnexionAction extends HttpServlet {

    @EJB
    private UtilisateurFacadeLocal utilisateurFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //Tableau pour noter les erreurs éventuelles
        ArrayList erreurs = new ArrayList();

        //récupérer les données de session si elles existent déjà				
        out.println("Dans la validation de formualire...");
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");

        //Tester les paramètres du formulaires
        if (mail == null || mail.equals("")) {
            erreurs.add("Veuillez remplir le champ email");
        }
        if (password == null || password.equals("")) {
            erreurs.add("Veuillez remplir le champ password");
        }

        out.println("Login:" + mail);
        out.println("Mot de passe:" + password);

        //Gestion des erreurs du formulaire
        if (erreurs.size() != 0) {
            // en cas d'existence de champs nulls , retourner au formualire en envoyant le 
            // tableau des erreurs comme attribut
            request.setAttribute("erreurs", erreurs);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } //Accèder à la couche service et invoquer la méthode à distante "getUtilisateurByLoginPassword"
        else {

            // Récupérer l'utilisateur correspondant aux paramètres saisis
            String generatedSecuredPasswordHash;
            try {
                generatedSecuredPasswordHash = generateStrongPasswordHash(password, getSalt(utilisateurFacade.getUtilisateurByMail(mail).getMdp()));
                //System.out.println("decrypte "+generatedSecuredPasswordHash);
                boolean matched = validatePassword(request.getParameter("password"), utilisateurFacade.getUtilisateurByMail(mail).getMdp());
                System.out.println(matched);

                Utilisateur u = utilisateurFacade.getUtilisateurByMailPassword(mail, generatedSecuredPasswordHash);

                // s'il est existant, le placer dans la session
                if (u != null) {
                  
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", u);
                    //passer à la page d'accueil
                    request.getRequestDispatcher("accueil.jsp").forward(request, response);

                } /* else if(! u.isEtat())
                                {
                                    erreurs.add("Votre compte est désactivé");
                                }*/ else {

                    //retourner au formulaire avec message d'erreur
                    erreurs.add("Veuillez saisir correctement vos paramètres de connexion...");
                    request.setAttribute("erreurs", erreurs);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ConnexionAction.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvalidKeySpecException ex) {
                Logger.getLogger(ConnexionAction.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static boolean validatePassword(String originalPassword, String storedPassword) throws NoSuchAlgorithmException, InvalidKeySpecException {
        String[] parts = storedPassword.split(":");
        int iterations = Integer.parseInt(parts[0]);
        byte[] salt = fromHex(parts[1]);
        byte[] hash = fromHex(parts[2]);

        PBEKeySpec spec = new PBEKeySpec(originalPassword.toCharArray(), salt, iterations, hash.length * 8);
        SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        byte[] testHash = skf.generateSecret(spec).getEncoded();

        int diff = hash.length ^ testHash.length;
        for (int i = 0; i < hash.length && i < testHash.length; i++) {
            diff |= hash[i] ^ testHash[i];
        }
        return diff == 0;
    }

    private static byte[] fromHex(String hex) throws NoSuchAlgorithmException {
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < bytes.length; i++) {
            bytes[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
        }
        return bytes;
    }

    private static String generateStrongPasswordHash(String password, byte[] originSalt) throws NoSuchAlgorithmException, InvalidKeySpecException {
        int iterations = 1000;
        char[] chars = password.toCharArray();
        byte[] salt = originSalt;

        PBEKeySpec spec = new PBEKeySpec(chars, salt, iterations, 64 * 8);
        SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        byte[] hash = skf.generateSecret(spec).getEncoded();
        return iterations + ":" + toHex(salt) + ":" + toHex(hash);
    }

    private static byte[] getSalt(String mdp) throws NoSuchAlgorithmException {
        String[] parts = mdp.split(":");
        int iterations = Integer.parseInt(parts[0]);
        byte[] salt = fromHex(parts[1]);
        byte[] hash = fromHex(parts[2]);
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
