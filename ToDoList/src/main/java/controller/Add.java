package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/addTask")
public class Add extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Get task details from the form
        String tasktitle = req.getParameter("tasktitle");
        String taskdescription = req.getParameter("taskdescription");
        String taskpriority = req.getParameter("taskpriority");
        String taskduedate = req.getParameter("taskduedate");

        // Retrieve the user from the session
        User user = (User) req.getSession().getAttribute("user");

        if (user != null) {
            int userid = user.getId();

            Dao dao = new Dao();

            // Create Task object
            Task task = new Task(tasktitle, taskdescription, taskpriority, taskduedate, "pending", userid);

            int res = 0;
            try {
                // Try to add the task to the database
                res = dao.createtask(task);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace(); // Log the error
                req.setAttribute("message", "An error occurred while adding the task: " + e.getMessage());
                req.getRequestDispatcher("addTask.jsp").forward(req, resp);
                return; // Stop further execution in case of error
            }

            // If task creation is successful
            if (res > 0) {
                resp.sendRedirect("home.jsp");
            } else {
                req.setAttribute("message", "Adding Task has Failed");
                req.getRequestDispatcher("addTask.jsp").forward(req, resp);
            }
        } else {
            resp.sendRedirect("index.jsp");
        }
    }
}
