/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package offreService;

import entity.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessions.ServiceFacadeLocal;

 
@WebServlet(name = "AllServicesShow", urlPatterns = {"/AllServicesShow"})
public class AllServicesShow extends HttpServlet {

    
    @EJB
    private ServiceFacadeLocal serviceFacade;
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        
        List<Service> services=serviceFacade.findAll();
        
        request.setAttribute("services", services);
        
        request.getRequestDispatcher("allServicesShow.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
