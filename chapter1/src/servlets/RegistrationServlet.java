package servlets;

import model.User;
import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(value = "/registration")
public class RegistrationServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/registration.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean error = false;
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        String password = request.getParameter("password");
        String rePassword = request.getParameter("repeat_password");
        if (password.equals(rePassword)) {
            User user = new User();
            user.setFullname(fullname);
            user.setEmail(email);
            user.setGender(gender);
            user.setAge(age);
            user.setPassword(password);
            if (DBManager.addUser(user)) {
                response.sendRedirect("/login");
            } else {
                request.setAttribute("error", error);
                request.getRequestDispatcher("/registration.jsp").forward(request, response);
            }
        } else {
            error = true;
            request.setAttribute("error", error);
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
        }
    }
}
