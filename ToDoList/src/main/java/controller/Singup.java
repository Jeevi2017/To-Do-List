package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.User; 

@WebServlet("/signup")
public class Singup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data from request
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        long contact = Long.parseLong(req.getParameter("contact"));
        String password = req.getParameter("password");

        // Create Dao and User objects
        Dao dao = new Dao();
        User user = new User(name, email, contact, password);

        // Save user data and handle redirection based on success or failure
        try {
            int res = dao.saveUser(user);
            if (res > 0) {
                resp.sendRedirect("login.jsp"); // Redirect to login if signup is successful
            } else {
                resp.sendRedirect("signup.jsp"); // Redirect back to signup on failure
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            // You could also forward to an error page or display a message
            resp.sendRedirect("error.jsp"); // Redirect to a custom error page
        }
    }
}
