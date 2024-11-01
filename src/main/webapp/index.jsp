<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
String successMessage = request.getParameter("success");
if ("true".equals(successMessage)) {
	out.println("<script>alert('Thank you! Your message has been sent successfully.'); window.location='index.jsp';</script>");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
<script src="script.js" defer></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
	
	<script>
	function showSideBar(){
		const sidebar = document.querySelector('.sidebar');
		sidebar.style.display='flex';
	}
	function hideSideBar(){
		const sidebar = document.querySelector('.sidebar');
		sidebar.style.display='none';
	}
</script>
<title>Feeding Hands</title>
</head>
<body>
	<nav>
		<ul class="sidebar">
			<li  onclick="hideSideBar()"><a><svg xmlns="http://www.w3.org/2000/svg" height="26px" viewBox="0 -960 960 960" width="26px"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg></a></li>
			<li><a href="#how-it-works">How it works</a></li>
			<li><a href="#about-us">About us</a></li>
			<li><a href="#contact-us">Contact us</a></li>
			<li><a href="login.jsp">Login</a></li>
		</ul>
		<ul>
			<li><h1>Feeding Hands <i class="fa-regular fa-handshake"></i></h1></a></li>
			<li class="hideOnMobile"><a href="#how-it-works">How it works</a></li>
			<li class="hideOnMobile"><a href="#about-us">About us</a></li>
			<li class="hideOnMobile"><a href="#contact-us">Contact us</a></li>
			<li class="hideOnMobile"><a href="login.jsp">Login</a></li>
			<li class="menubutton btn" onclick="showSideBar()"><svg xmlns="http://www.w3.org/2000/svg" height="26px" viewBox="0 -960 960 960" width="26px"><path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/></svg></li>
		</ul>
	</nav>
	<div class="bg-cont">
		<div class="bg-image"></div>
	</div>
	
	<section id="how-it-works">
		<h2>How It Works</h2>
		<div class="steps">
			<div class="step">
				<i class="fas fa-user-plus"></i>
				<h3>Step 1: Register</h3>
				<p>Donors and acceptors can easily register on our platform to
					start the process.</p>
			</div>
			<div class="step">
				<i class="fas fa-gift"></i>
				<h3>Step 2: Donate</h3>
				<p>Donors can select items they wish to donate and provide
					details about the food.</p>
			</div>
			<div class="step">
				<i class="fas fa-hand-holding-heart"></i>
				<h3>Step 3: Request</h3>
				<p>Acceptors can browse available donations and request items
					they need.</p>
			</div>
			<div class="step">
				<i class="fas fa-truck"></i>
				<h3>Step 4: Delivery</h3>
				<p>We coordinate the delivery of food items to those in need in
					our community.</p>
			</div>
		</div>
	</section>
	<hr>
	<section id="about-us">
		<h2>About Us</h2>
		<p>Welcome to <strong>Feeding Hands- A food charity platform </strong>, a dedicated organization committed
			to fighting hunger and food insecurity in our community. Founded in
			2024, we strive to ensure that no one goes to bed hungry.</p>

		<h3>Our Mission</h3>
		<p>Our mission is to rescue surplus food and distribute it to
			those in need, while also educating our community about food waste
			and nutrition. We believe that everyone deserves access to healthy
			and nutritious meals.</p>

		
		<h3>Impact Stories</h3>
		<blockquote>
			Thanks to Feeding Hands , I was able to feed my family during tough
			times. Your support means the world to us! - <em>[UNKNOWN]</em>
		</blockquote>
		<blockquote>
			We are grateful for the meals provided. They have made a significant
			difference in our lives. - <em>[UNKNOWN]</em>
		</blockquote>
	</section>
	<hr>
	<section id="contact-us">
    <h2>Contact Us</h2>
    <p>If you have any questions, suggestions, or would like to get involved, please fill out the form below or reach out to us through the contact details provided.</p>
    
    <div class="contact-info">
        <h3>Contact Information</h3>
        <p><strong>Email:</strong> XYZ@gmail.com</p>
        <p><strong>Phone:</strong> (123) 456-7890</p>
        <p><strong>Address:</strong> ABC , City, State, ZIP</p>
    </div>

    <form id="contact-form" action="submit_contact.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="message">Message:</label>
        <textarea id="message" name="message" rows="5" required></textarea>
        
        
        <button type="submit">Send Message</button>
    </form>
</section>
	

</body>
</html>