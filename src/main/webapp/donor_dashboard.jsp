<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
final String URL = "jdbc:mysql://localhost:3306/feedingHands";
final String username = "root";
final String password = "W@2915djkq#";
Connection con;
PreparedStatement pst;
ResultSet rst;
String name = " ";
int user_id=0;
int totalDonations = 0;
int quantity=0;
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />

<script>
	function showSideBar() {
		const sidebar = document.querySelector('.sidebar');
		sidebar.style.display = 'flex';
	}
	function hideSideBar() {
		const sidebar = document.querySelector('.sidebar');
		sidebar.style.display = 'none';
	}
</script>
<title>Feeding Hands</title>
</head>
<body>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(URL, username, password);
		if (con != null) {
			name = request.getParameter("name");
			String userIdParam = request.getParameter("user_id");
			if (userIdParam != null && !userIdParam.isEmpty()) {
		user_id = Integer.parseInt(userIdParam);
		String query = "SELECT COUNT(*) AS total_donations, SUM(quantity) AS total_quantity FROM Donations WHERE user_id = ?;";
		pst = con.prepareStatement(query);
		pst.setInt(1, user_id);
		rst = pst.executeQuery();
		if (rst.next()) {
			totalDonations = rst.getInt("total_donations");
			quantity=rst.getInt("total_quantity");
		}
			}
	%>
	<nav>
		<ul class="sidebar">
			<li onclick="hideSideBar()"><a><svg
						xmlns="http://www.w3.org/2000/svg" height="26px"
						viewBox="0 -960 960 960" width="26px">
						<path
							d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z" /></svg></a></li>
			<li><a href="#how-it-works">Overview</a></li>
			<li><a href="#about-us">Add new Food</a></li>
			<li><a href="#contact-us">View Donation</a></li>
			<li><a href="login.jsp">profile</a></li>
		</ul>
		<ul>
			<li><h1>
					Welcome,
					<%=name%></h1>
				</a></li>
			
			<li class="hideOnMobile"><a href="#overview">Overview</a></li>
			<li class="hideOnMobile"><a href="#add-food">Add new Food</a></li>
			<li class="hideOnMobile"><a href="#view-donations">View Donation</a></li>
			<li class="hideOnMobile"><a href="login.jsp">profile</a></li>
			<li class="hideOnMobile"><a href="index.jsp">Sign out</a></li>
			<li class="menubutton btn" onclick="showSideBar()"><svg
					xmlns="http://www.w3.org/2000/svg" height="26px"
					viewBox="0 -960 960 960" width="26px">
					<path
						d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z" /></svg></li>
			
		</ul>
	</nav>
	
	<section class="main-content">
		<h1 id="overview">Donation Dashboard Overview</h1>
		<div class="dashboard-container">
			<div class="overview-cards">
				<div class="card">
					<h2>Total Donations</h2>
					<p id="total-donations">
						<%=totalDonations%></p>
				</div>
				<div class="card">
					<h2>Total Quantity Donated</h2>
					<p id="total-quantity"><%=quantity%> kg</p>
				</div>
				<div class="card">
					<h2>Total Requests Fulfilled</h2>
					<p id="requests-fulfilled">20</p>
				</div>

			</div>
		</div>
	</section>
	<hr>
	<section id="add-food">
                <h2>Add New Food</h2>
                <form action="add_food.jsp" method="post">
                    <label for="food-type">Food Type:</label>
                    <input type="text" id="food-type" name="food-type" required>

                    <label for="quantity">Quantity (kg):</label>
                    <input type="number" id="quantity" name="quantity" required>

                    <label for="available-until">Available Until:</label>
                    <input type="date" id="available-until" name="available-until" required>

                    

                    <button type="submit"><a href="add_food.jsp?user=<%=user_id%>">Add Food</a></button>
                </form>
            </section>
            <section id="view-donations">
                <table>
                	<h2>View Donations</h2>
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Food Type</th>
                            <th>Quantity (kg)</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2024-11-01</td>
                            <td>Pasta</td>
                            <td>20</td>
                            <td>Picked Up</td>
                        </tr>
                        <tr>
                            <td>2024-11-02</td>
                            <td>Salad</td>
                            <td>10</td>
                            <td>Available</td>
                        </tr>
                    </tbody>
                </table>
            </section>
	














	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

</body>
</html>