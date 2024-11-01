<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
String successMessage = request.getParameter("success");
if ("true".equals(successMessage)) {
	out.println("<script>alert('Successfully Registered.'); window.location='login.jsp';</script>");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
    <title>Login & Sign Up Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }


        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: rgba(0,0,0,0.5);
        }


        .form-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            transition: transform 0.3s ease-in-out;
        }


        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }


        .form-group {
            margin-bottom: 15px;
        }

 
        label {
            display: block;
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 5px;
        }


        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            outline: none;
        }


        input:focus, select:focus, textarea:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }


        .btn {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }


        .btn:hover {
            background-color: #0056b3;
        }

 
        .toggle-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
            cursor: pointer;
        }
    </style>
</head>
<body>


    <div class="form-container" id="login-form">
        <h2>Login</h2>
        <form action="submit_login.jsp" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn">Login</button>
        </form>
        <p class="toggle-link" onclick="toggleForms()">New user? Sign Up here</p>
    </div>

    <!-- Sign Up Form -->
    <div class="form-container" id="signup-form" style="display: none;">
        <h2>Sign Up</h2>
        <form action="submit_signup.jsp" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>       
            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" rows="2" required></textarea>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="number" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="role">Role</label>
                <select id="role" name="role" required>
                    <option value="">Select Role</option>
                    <option value="Donor">Donor</option>
                    <option value="Charity">Charity</option>
                </select>
            </div>
            <button type="submit" class="btn">Sign Up</button>
        </form>
        <p class="toggle-link" onclick="toggleForms()">Already have an account? Login here</p>
    </div>

    <!-- JavaScript to Toggle Forms -->
    <script>
        function toggleForms() {
            const loginForm = document.getElementById('login-form');
            const signupForm = document.getElementById('signup-form');

            if (loginForm.style.display === 'none') {
                loginForm.style.display = 'block';
                signupForm.style.display = 'none';
            } else {
                loginForm.style.display = 'none';
                signupForm.style.display = 'block';
            }
        }
    </script>

</body>
</html>

