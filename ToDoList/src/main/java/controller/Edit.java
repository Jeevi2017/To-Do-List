package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/edit")
public class Edit extends HttpServlet 
{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		Dao dao = new Dao();
		HttpSession session = req.getSession();
		User u = (User) session.getAttribute("user");
		
		if (u != null) {
		try {
			Task task = dao.findtaskById(id);
			
			if (task.getUserid() == u.getId()) {
				req.setAttribute("task", task);
				RequestDispatcher dispatcher = req.getRequestDispatcher("edittask.jsp");

				dispatcher.include(req, resp);
			}else {
				req.setAttribute("message","UnAuthorisation of edit");
				req.getRequestDispatcher("logout").forward(req, resp);
				
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}else {
		resp.sendRedirect("index.jsp");
	}
	
	}}
