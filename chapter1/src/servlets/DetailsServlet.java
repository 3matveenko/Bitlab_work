package servlets;

import db.DBManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "DetailsServlet", value = "/DetailsServlet")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = DBManager.findById(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/details.jsp").forward(request, response);    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        String password = request.getParameter("password");
            User user = new User();
            user.setFullname(fullname);
            user.setEmail(email);
            user.setGender(gender);
            user.setAge(age);
            user.setPassword(password);
            DBManager.updateUser(user);
            response.sendRedirect("/users");

    }
}
