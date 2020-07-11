 
package offreService;

import entity.Service;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessions.ServiceFacadeLocal;

 
@WebServlet(name = "ServiceShowDetails", urlPatterns = {"/ServiceShowDetails"})
public class ServiceShowDetails extends HttpServlet {

    @EJB
    private ServiceFacadeLocal serviceFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          Long id = Long.parseLong(request.getParameter("id"));
         Service service = new Service();
         service = serviceFacade.find(id);         
        request.setAttribute("service", service);
        request.getRequestDispatcher("offreShowDetails.jsp").forward(request, response);
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
