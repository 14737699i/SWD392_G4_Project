/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.common;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author win
 */
public class HomeController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

//        List<Blog> listBlog_HomePage = new BlogDAO().getAllBlog();
//        session.setAttribute("listBlog_HomePage", listBlog_HomePage);

//        Slider listSlider_HomePageFirst = new SliderDAO().getFirstSlider();
//        session.setAttribute("sliderFirst", listSlider_HomePageFirst);
        CategoryDAO c = new CategoryDAO();

        List<Category> l = c.getAllCategoryMale();
        List<Category> l1 = c.getAllCategoryFemale();
       
        
        session.setAttribute("listCategoriesMale", l);
        session.setAttribute("listCategoriesFemale", l1);

       System.out.println(l.get(0).getGender());

        //int totalSlider = new SliderDAO().getcountSlider();
        //session.setAttribute("totalSlider", totalSlider);

        //List<Slider> listSlider_HomePageAll = new SliderDAO().getALLSlider();
        //session.setAttribute("listSlider_HomePageAll", listSlider_HomePageAll);

        List<Product> list4product = new ProductDAO().get4ProductRandom();
                
        session.setAttribute("list4product", list4product);

        session.setAttribute("historyUrl", "home");

        request.getRequestDispatcher("index.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
