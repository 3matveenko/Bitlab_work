package servlets;

import model.User;
import db.DBManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean error = true;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = new User();
        user.setPassword(password);
        user.setEmail(email);
        if (DBManager.searchUser(user) != null) {
            if (DBManager.searchUser(user)) {
                response.sendRedirect("/users");
            }
            if (!DBManager.searchUser(user)) {
                request.setAttribute("error", error);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            error = false;
            request.setAttribute("error", error);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }
}
