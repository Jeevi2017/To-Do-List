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
import dto.User;
@WebServlet("/login")
public class Login extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Dao dao = new Dao();
		
		try {
			User u = dao.findByEmail(email);
 
			if(u!=null) {
					//verify the password
				if((u.getPassword()).equals(password)) {
					//login success
					//create session and set the data
					// get all the tasks related to user id from User
					
					HttpSession session = req.getSession();
					session.setAttribute("user", u);
					
					resp.sendRedirect("home.jsp");
				}else {
					//password wrong
					req.setAttribute("message", "Password wrong");
					req.getRequestDispatcher("index.jsp").forward(req, resp);
				}
			}else {
				// email is wrong
				req.setAttribute("message", "Invalid Mail Id");
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
