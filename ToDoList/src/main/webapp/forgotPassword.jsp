<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="head.jsp" %>
</head>
<body>

	<div class="wrapper" >
        <div class="logo">
           <img src="https://www.freepnglogos.com/uploads/paper-plane-png/black-paper-plane-paper-aeroplane-vector-icon-data-for-8.png" alt="">
      </div>
        <div class="text-center mt-4 name">
          Forgot Password
        </div>
        <form class="p-3 mt-3" action="forgotpassword" method="post">
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-envelope"></span>
                <input type="email" name="mail" id="userName" placeholder="Mail Id" required="required">
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
            <button class="btn mt-3">Generate New Password</button>
        </form>
        <div class="text-center fs-6">
            <a href="signup.jsp">New Sign Up?</a> or <a href="index.jsp">Login?</a>
        </div>
    </div>



<!-- footer page -->
<%@ include file="footer.html" %>
</body>
</html>
