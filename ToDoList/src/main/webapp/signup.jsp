<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> 

    <%@ include file="head.jsp" %> <!-- Include the head content -->
</head>
<body>

<div class="wrapper" style="max-width: 450px; margin: 20px auto;">
    <div class="logo">
        <img src="https://www.freepnglogos.com/uploads/paper-plane-png/black-paper-plane-paper-aeroplane-vector-icon-data-for-8.png" alt="Logo">
    </div>
    
    <div class="text-center mt-4 name">
        ToDo SignUp
    </div>

    <!-- SignUp form -->
    <form class="p-3 mt-3" action="signup" method="post">
        <div class="form-field d-flex align-items-center">
            <span class="far fa-user"></span>
            <input type="text" name="name" id="userName" placeholder="Username" required>
        </div>

        <div class="form-field d-flex align-items-center">
            <span class="fas fa-envelope"></span>
            <input type="email" name="email" id="email" placeholder="Mail Id" required>
        </div>
        
        <div class="form-field d-flex align-items-center">
            <span class="fas fa-phone"></span>
            <input type="tel" name="contact" id="phone" placeholder="Phone Number" required>
        </div>
        
        <!-- Uncomment the following block if profile photo upload is required -->
        <!-- 
        <div class="form-field d-flex align-items-center">
            <span class="fas fa-image"></span>
            <input type="file" name="profilePhoto" id="profilePhoto" accept="image/*">
        </div> 
        -->

        <div class="form-field d-flex align-items-center">
            <span class="fas fa-key"></span>
            <input type="password" name="password" id="password" placeholder="Password" required>
        </div>
		
		
                             <% String message = (String) request.getAttribute("message"); %>
   								 <% if (message != null) { %>
      							  <div class="alert alert-warning text-warning small mb-3" role="alert">
           					 <%= message.toLowerCase() %></div>
       							 
    								<% } %>
		
        <button class="btn mt-3">Submit</button>
    </form>

    <!-- Link to login if already signed up -->
    <div class="text-center fs-6">
        <a href="index.jsp">Already Account Signed Up?</a> 
    </div>
</div>



<!-- footer page -->
<%@ include file="footer.html" %>
</body>
</html>
