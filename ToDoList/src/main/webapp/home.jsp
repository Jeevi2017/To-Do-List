<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.*, dao.Dao, java.util.List" %>

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
        /* Wrapper for tasks table */
        .wrapper {
            max-width: 1400px;
            max-height: 550px;
            opacity: 0.9;
            overflow-y: scroll;
            scrollbar-width: none; /* Hides scrollbar in Firefox */
        }

        /* Table header styling */
        th {
            color: black;
        }

        /* Add Task button */
        .btn {  
            max-width: 125px;
            margin-bottom: 10px;
            float: right;
            color: white;
            font-weight: 600;
            font-size: 0.9rem;
            letter-spacing: 1.3px;
            text-decoration: none;
        }
        .btn:hover span {
            color: black;
            transition: color 0.5s, background-color 0.5s; /* Smooth color transition */
        }

        /* Message when no tasks are available */
        .no-tasks-message {
            text-align: center;
            color: red;
        }

        /* Delete and Edit button styling */
        .deleteEdit-btn a {
            color: black;
            border: 2px solid black;
            text-decoration: none; /* Removes underline */
            margin-right: 15px;
            padding: 5px; /* Adds space around the text */
            display: inline-block;
        }

        /* Hover effect for Delete button */
        .deleteEdit-btn a.delete:hover {
            color: red;
            border-color: red;
        }

        /* Hover effect for Edit button */
        .deleteEdit-btn a.edit:hover {
            color:  blue;
            border-color: blue;
        }

        /* Icons for Delete and Edit buttons */
        .icon {
            margin-right: 5px;
            vertical-align: middle; /* Aligns the icon with text */
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %> <!-- Include header content -->
    <%
        String name = user.getName().toUpperCase();
    %>

    <div>
        <h2 style="margin: 10px;">Hello, <%= name %>!</h2>
    </div>

    <div class="wrapper">
        <h3 style="display: inline;">Your tasks are waiting!</h3>
        <a href="addTask.jsp" class="btn"><span>Add</span></a>

        <table class="table task-table table-hover">
            <thead>
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">Title</th>
                    <th scope="col">Description</th>
                    <th scope="col">Priority</th>
                    <th scope="col">Due Date</th>
                    <th scope="col">Status</th>
                    <th scope="col">Delete</th>
                    <th scope="col">Edit</th>
                </tr>
            </thead>
            <tbody>
                <% 
                Dao dao = new Dao(); 
                List<Task> tasks = dao.getalltasksByUserId(user.getId());  

                if (tasks == null || tasks.isEmpty()) { %>
                    <tr>
                        <td colspan="8" class="no-tasks-message">No tasks are available for you!</td>
                    </tr>
                <% } else { 
                    int num = 1;
                    for (Task task : tasks) { %>
                        <tr>
                            <td><%= num++ %></td>
                            <td><%= task.getTasktitle() %></td>
                            <td><%= task.getTaskdescription() %></td>
                            <td><%= task.getTaskpriority() %></td>
                            <td><%= task.getTaskduedate() %></td>
                            <td><%= task.getTaskstatus() %></td>
                            <td class="deleteEdit-btn">
                                <a href="delete?id=<%= task.getTaskid() %>" class="delete">
                                    <i class="fas fa-trash icon"></i>Delete
                                </a>
                            </td>
                            <td class="deleteEdit-btn">
                                <a href="edit?id=<%= task.getTaskid() %>" class="edit">
                                    <i class="fas fa-pencil-alt icon"></i>Edit
                                </a>
                            </td>
                        </tr>
                <% }
                    } %>
            </tbody>
        </table>
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
