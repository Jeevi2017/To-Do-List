<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.User" %>

<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="head.jsp" %> <!-- Include the head content -->
    <style>
        /* Form field styles */
        .form-field {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            width: 100%;
        }

        .wrapper {
            max-width: 500px;
            min-height: 400px;
             
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a slight shadow */
            background-color: #f9f9f9; /* Light background for the form */
        }

        .text-center {
            text-align: center;
            font-size: 1.5rem;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .form-field i {
            font-size: 1.2rem;
        }

        .priority-container {
            display: flex;
            gap: 10px; /* Space between radio buttons */
            flex-wrap: wrap; /* Allows wrapping of priority options */
        }

        .priority-option {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .priority-section {
            display: flex;
            align-items: center;
            gap: 20px; /* Space between icon and priority options */
            width: 100%;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            gap: 20px; /* Space between buttons */
            margin-bottom: 20px;
        }

        .btn {
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <%@ include file="header.jsp" %>
 
    <div class="wrapper">
        <div class="text-center mt-4 name">
            Adding Task
        </div>

        <!-- Add Task form -->
        <form action="addTask" method="post">
            <div class="form-field">
                <i class="fas fa-tasks"></i>
                <input type="text" id="tasktitle" name="tasktitle" placeholder="Task Title" required>
            </div>
            <div class="form-field mt-3">
                <i class="fas fa-align-left"></i>
                <textarea id="taskdescription" name="taskdescription" placeholder="Task Description"></textarea>
            </div>

            <!-- Priority Section -->
            <div class="form-field mt-3 priority-section">
                <i class="fas fa-exclamation-circle"></i>
                <span>Priority:</span>
                <div class="priority-container">
                    <div class="priority-option">
                        <input type="radio" id="low" value="Low" name="taskpriority">
                        <label for="low">Low</label>
                    </div>
                    <div class="priority-option">
                        <input type="radio" id="medium" value="Medium" name="taskpriority">
                        <label for="medium">Medium</label>
                    </div>
                    <div class="priority-option">
                        <input type="radio" id="high" value="High" name="taskpriority">
                        <label for="high">High</label>
                    </div>
                </div>
            </div>

            <div class="form-field mt-3">
                <i class="fas fa-calendar-alt"></i>
                <input type="date" id="taskduedate" name="taskduedate">
            </div>
            
            <!-- Display error message if available -->
            <% 
                String message = (String) request.getAttribute("message"); 
                if (message != null) { 
            %>
                <div class="error-message">
                    <%= message %>
                </div>
            <% 
                } 
            %>
			
            <div class="btn-container mt-4">
                <button type="submit" class="btn">Add this Task</button>
                <button type="button" class="btn" onclick="window.location.href='home.jsp'">Home Page</button>
            </div>
        </form>
    </div>
    
    <!-- footer page -->
    <%@ include file="footer.html" %>
</body>
</html>

<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>
