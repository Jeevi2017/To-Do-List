<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="head.jsp" %> <!-- Include the head content -->
</head>
<body>

    <div class="wrapper">
        <div class="logo">
            <img src="https://www.freepnglogos.com/uploads/paper-plane-png/black-paper-plane-paper-aeroplane-vector-icon-data-for-8.png" alt="Logo">
        </div>
        
        <div class="text-center mt-4 name">
            ToDo Login
        </div>
        
        <!-- Login form -->
        <form class="p-3 mt-3" action="login" method="post">
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-envelope"></span>
                <input type="email" name="email" id="email" placeholder="Mail Id" required>
            </div>
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-key"></span>
                <input type="password" name="password" id="password" placeholder="Password" required>
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
            
            <button class="btn mt-3">Login</button>
        </form>
        
        <!-- Links for password recovery and signup -->
        <div class="text-center fs-6">
            <a href="forgotPassword.jsp">Forgot password?</a> or <a href="signup.jsp">Sign up?</a>
        </div>
    </div>



<!-- footer page -->
<%@ include file="footer.html" %> 

</body>
</html>
