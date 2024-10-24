<!-- Bootstrap CSS -->
<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">

<title>To Do List Project</title>  

<!-- Add icon link -->
<link rel="icon" href="https://www.freepnglogos.com/uploads/paper-plane-png/black-paper-plane-paper-aeroplane-vector-icon-data-for-8.png" type="image/x-icon">

<style>
/* Importing fonts from Google */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

/* Resetting default margin and padding, setting the font to Poppins */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

/* Setting the background image for the body */
body {
    background: url('https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
    background-size: cover; /* Ensure the image covers the whole page */
    background-position: center; /* Center the image */
    background-repeat: no-repeat; /* Prevent image from repeating */
    color: white; /* White text for readability */
}

/* Wrapper for the form, with shadows and rounded corners */
.wrapper {
    color: black;
    max-width: 400px;
    min-height: 500px;
    margin: 80px auto;
    padding: 10px 30px 30px 30px;
    background-color: #ecf0f3;
    border-radius: 15px;
    box-shadow: 13px 13px 20px #cbced1;
    position: relative; /* Set relative positioning to contain the absolute element inside */
}

/* Logo image styling */
.logo {
    width: 110px;
    margin: auto;
}

.logo img {
    width: 100%;
    height: 100px;
}

/* Name heading inside the wrapper */
.wrapper .name {
    font-weight: 600;
    font-size: 1.4rem;
    letter-spacing: 1.3px;
    padding-left: 10px;
    color: #555;
}

/* Form input fields inside the wrapper */
.wrapper .form-field input:not([type="radio"]) {
    width: 100%;
    display: block;
    border: none;
    outline: none;
    background: none;
    font-size: 1.2rem;
    color: #666;
    padding: 10px 15px 10px 10px;
}

.wrapper .form-field textarea  {
    width: 100%;
    display: block;
    border: none;
    outline: none;
    background: none;
    font-size: 1.2rem;
    color: #666;
    padding: 10px 15px 10px 10px;
}

/* Form field styling with inner shadows for a 3D effect */
.wrapper .form-field {
    padding-left: 10px;
    margin-bottom: 20px;
    border-radius: 20px;
    box-shadow: inset 8px 8px 8px #cbced1, inset -8px -8px 8px #fff;
}

/* FontAwesome icon color in the form fields */
.wrapper .form-field .fas {
    color: #555;
}

/* Submit button styling */
.wrapper .btn {
    box-shadow: none;
    width: 100%;
    height: 40px;
    background-color: black;
    color: #fff;
    border-radius: 25px;
    box-shadow: 3px 3px 3px #b1b1b1, -3px -3px 3px #fff;
    letter-spacing: 1.3px;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

/* Button hover effect with animation */
.wrapper .btn:hover {
    background-color: grey;
    transform: scale(1.05); /* Slight zoom on hover */
}

/* Link styling within the wrapper */
.wrapper a {
    text-decoration: none; /* Removes underline */
    font-size: 0.8rem; /* Sets font size */
    color: grey; /* Sets text color to grey */
    padding: 10px; /* Adds padding for a neater look */
    transition: color 0.3s ease, transform 0.3s ease;
}

/* Hover effect for links with animation */
.wrapper a:hover {
    color: #039BE5; /* Blue color on hover */
    transform: translateY(-2px); /* Slight move upwards on hover */
}

/* Styling error messages */
.error-message {
    color: red;
    font-weight: bold;
    margin-top: 10px;
}

.navigatbar-btn {
    position: absolute;
    top: 10px; /* Adjusts distance from the top */
    right: 10px; /* Adjusts distance from the right */
    padding: 10px;
    font-size: 18px;
}

.navigatbar-btn a {
    color: white;
    text-decoration: none; /* Removes underline */
    margin-right: 15px; /* Adds space between Profile and Logout buttons */
    transition: color 0.3s ease, transform 0.3s ease;
}

.navigatbar-btn a:last-child {
    margin-right: 0; /* Removes margin on the last button to avoid extra space */
}

/* Hover effect for Profile button with animation */
.navigatbar-btn a:first-child:hover {
    color: blue; /* Changes Profile button color to blue on hover */
    transform: translateY(-2px); /* Slight move upwards on hover */
}

/* Hover effect for Logout button with animation */
.navigatbar-btn a:last-child:hover {
    color: red; /* Changes Logout button color to red on hover */
    transform: translateY(-2px); /* Slight move upwards on hover */
}

/* Responsive styling for screens smaller than 500px */
@media(max-width: 500px) {
    .wrapper {
        margin: 30px 20px;
        padding: 40px 15px 15px 15px;
    }
}

</style>
