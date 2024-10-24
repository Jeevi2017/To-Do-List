package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/updatetask")
public class Update extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int taskid = Integer.parseInt(req.getParameter("id"));
		String tasktitle = req.getParameter("tasktitle");
		String taskdescription = req.getParameter("taskdescription");
		String taskpriority = req.getParameter("taskpriority");
		String taskduedate = req.getParameter("taskduedate");
		String taskstatus = req.getParameter("taskstatus");

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		Dao dao = new Dao();
		
		
		Task dbtask;
		try {
			dbtask = dao.findtaskById(taskid);
		

		if (taskpriority == null) {
			taskpriority = dbtask.getTaskpriority();
		}

		Task task = new Task(taskid, tasktitle, taskdescription, taskpriority, taskduedate, taskstatus,
				user.getId());

//		System.out.println("------------>" + task + "<--------------");

		dao.updateTask(task);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("home.jsp");
	}


	
}
