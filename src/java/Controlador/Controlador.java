
package Controlador;


import Modelo.Aprendiz;
import Modelo.AprendizDAO;
import Modelo.Persona;
import ModeloDAO.PersonaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Controlador extends HttpServlet {
    AprendizDAO dao = new AprendizDAO();
    Aprendiz p = new Aprendiz();
    int r;
    
    String MenuInt = "MenuPrincipal.jsp";
    String add="vistas/add.jsp";
    String edit="vistas/edit.jsp";
    Persona per = new Persona();
    PersonaDAO DAO = new PersonaDAO();
    int id;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        
        String accion = request.getParameter("accion");
        if (accion.equals("Ingresar")){
            String nom = request.getParameter("txtnom");
            String correo = request.getParameter("txtCorreo");
            p.setNombre(nom);
            p.setEmail(correo);
            r=dao.Validar(p);
            
            if (r == 1){
                request.getSession().setAttribute("nom", nom);
                request.getRequestDispatcher("MenuPrincipal.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }else{
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
        if(action.equalsIgnoreCase("add")){
            acceso=add;
        }
        else if(action.equalsIgnoreCase("Agregar")){
            String nom =request.getParameter("txtNom");
            String email =request.getParameter("txtEmail");
            per.setNombre(nom);
            per.setEmail(email);
            DAO.add(per);
            acceso=MenuInt;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idper",request.getParameter("id"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String nom =request.getParameter("txtNom");
            String email =request.getParameter("txtEmail");
            per.setId(id);
            per.setNombre(nom);
            per.setEmail(email);
            DAO.edit(per);
            acceso=MenuInt;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            per.setId(id);
            DAO.eliminar(id);
            acceso=MenuInt;
        }
        RequestDispatcher vista= request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
