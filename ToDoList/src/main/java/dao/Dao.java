package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Task;
import dto.User;

public class Dao {

    // Method to establish connection to the database
    public static Connection getConnection() {
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");

	        return DriverManager.getConnection("jdbc:mysql:///todo?user=root&password=root");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}  // Load MySQL JDBC Driver 
    }

    // Method to save a user to the database
    public int saveUser(User user) throws ClassNotFoundException {
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(
                "INSERT INTO users (name, mail, contact, password) VALUES (?, ?, ?, ?)"
            )) {
            pst.setString(1, user.getName());
            pst.setString(2, user.getMail());
            pst.setLong(3, user.getContact());
            pst.setString(4, user.getPassword()); 

            return pst.executeUpdate();  // Return the result of the update
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;  // Return 0 if there is an exception
        }
    }

    // Method to find a user by email in the database
    public User findByEmail(String email) throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE mail = ?")) {
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setMail(rs.getString(3));
                u.setContact(rs.getLong(4));
                u.setPassword(rs.getString(6));

                return u;  // Return the user if found
            } else {
                return null;  // Return null if no user is found
            }
        }
    }

    // Method to update the password of a user
    public int updateUserPassword(User u) throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement("UPDATE users SET password = ? WHERE id = ?")) {
            pst.setString(1, u.getPassword());
            pst.setInt(2, u.getId());

            return pst.executeUpdate();  // Return the result of the update
        }
    }
    
    public int createtask(Task task) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        
        // Assuming the first column (task ID) is auto-incremented and hence not set manually.
        String sql = "INSERT INTO tasks (title, description, priority,  duedate,  status, userid) VALUES (?,?,?,?,?,?)";
        PreparedStatement pst = con.prepareStatement(sql);
        
        // Setting values for each column based on the Task object
        pst.setString(1, task.getTasktitle());      // Task Title
        pst.setString(2, task.getTaskdescription()); // Task Description
        pst.setString(3, task.getTaskpriority());    // Task Priority (low, medium, high)
        pst.setString(4, task.getTaskduedate());     // Task Due Date
        pst.setString(5, task.getTaskstatus());      // Task Status (e.g., pending, completed)
        pst.setInt(6, task.getUserid());             // User ID

        // Execute the update and return the result (number of rows affected)
        int res = pst.executeUpdate();
        
        // Close resources (optional, but recommended)
        pst.close();
        con.close();
        
        return res;
    }
    //Method to get Task List by user id
    public List<Task> getalltasksByUserId(int userid) throws SQLException, ClassNotFoundException{
		
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from tasks where userid = ?");
		pst.setInt(1, userid);
		ResultSet rs = pst.executeQuery();
		List<Task> tasks = new ArrayList<Task>();
		while(rs.next()) {
			Task task = new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			tasks.add(task);
		}
		return tasks;
		
	}
    

	public Task findtaskById(int taskid) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("SELECT * from tasks where id = ?");
		pst.setInt(1, taskid);
		ResultSet rs = pst.executeQuery();
		rs.next();
		Task task = new Task(taskid, rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
		return task;
		
	}
	

	public int deleteTaskById(int taskid)   {
		Connection con = getConnection();
		PreparedStatement pst;
		try {
			pst = con.prepareStatement("delete from tasks where id = ? ");
			pst.setInt(1, taskid);
			return   pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		 
	}
	
	public void updateTask(Task task) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("update tasks set  title=? , description=? , priority=?,  duedate=?,  status=?, userid=? where  id =? ");
		
		pst.setString(1,task.getTasktitle());
		pst.setString(2, task.getTaskdescription());
		pst.setString(3,task.getTaskpriority());
		pst.setString(4,task.getTaskduedate());
		pst.setString(5,task.getTaskstatus());
		pst.setInt(6, task.getUserid());
		pst.setInt(7, task.getTaskid());
		
		pst.executeUpdate();
		
	}
	public void updatePriorityBasedOnDuration() throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		Statement st = con.createStatement();
		st.execute("UPDATE tasks SET priority = 'High' WHERE (duedate BETWEEN CURDATE() AND CURDATE() +  INTERVAL 3 DAY) OR(duedate < CURDATE())");
		st.execute("UPDATE tasks SET priority = 'Medium' WHERE duedate BETWEEN CURDATE() + INTERVAL 4 DAY AND CURDATE() + INTERVAL 7 DAY");
		st.execute("UPDATE tasks SET priority = 'Low' WHERE duedate > CURDATE() + INTERVAL 7 DAY");
	}
	
	
	
	
}
