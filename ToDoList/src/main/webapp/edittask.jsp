<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.*" %>

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
            max-width: 700px;
            min-height: 400px;
            position: relative;
        }

        .form-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px; /* Space between columns */
        }

        .form-field-half {
            width: 48%; /* Two columns with a little gap */
        }

        .form-field i {
            font-size: 1.2rem;
        }

        .priority-container {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .priority-option {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .priority-section {
            display: flex;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            width: 100%;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
               
            gap: 20px; /* Space between columns */
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

    </style>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <%@ include file="header.jsp" %>
    <%
        Task task = (Task)request.getAttribute("task");
    %>
    <div class="wrapper">
        <div class="text-center mt-4 name">
            Editing Task 
        </div>
        <br>
        <!-- Add Task form -->
        <form action="updatetask?id=<%=task.getTaskid() %>" method="post">
            <div class="form-container">
                <!-- First Column -->
                <div class="form-field form-field-half">
                    <i class="fas fa-tasks"></i>
                    <input type="text" id="tasktitle" name="tasktitle" value="<%=task.getTasktitle() %>" required>
                </div>
                <div class="form-field form-field-half">
                    <i class="fas fa-align-left"></i>
                    <textarea id="taskdescription" name="taskdescription"><%=task.getTaskdescription() %></textarea>
                </div>

                <!-- Second Column -->
                <div class="form-field form-field-half priority-section">
                    <i class="fas fa-exclamation-circle"></i>
                    <span>Current Priority: </span><span>  <%= task.getTaskpriority() %></span>
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

                <div class="form-field form-field-half">
                    <i class="fas fa-calendar-alt"></i>
                    <input type="date" id="taskduedate" name="taskduedate" value="<%=task.getTaskduedate() %>">
                </div>
                
                <div class="form-field form-field-half">
                    <i class="fas fa-hourglass-half"></i>
                    <input type="text" id="taskstatus" name="taskstatus" value="<%=task.getTaskstatus() %>">
                </div>
            </div>

            <!-- Display error message if available -->
            <%
                String message = (String) request.getAttribute("message"); 
                if (message != null) { 
            %>
                <div class="error-message">
                    <%= message %>
                </div>
            <% } %>

            <!-- Buttons in the same row -->
            <div class="btn-container">
                <button type="submit" class="btn mt-3">Update <%=task.getTasktitle() %> Task</button>
                <button type="button" class="btn mt-3" onclick="window.location.href='home.jsp'">Home Page</button>
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
