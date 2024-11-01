<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	final String URL= "jdbc:mysql://localhost:3306/feedingHands";
	final String username="root";
	final String password= "W@2915djkq#";
	Connection con;
	PreparedStatement pst;
	int user_id=0;
	int quantity=0;
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	con=DriverManager.getConnection(URL,username,password);
    	if(con != null){
    		String userIdParam = request.getParameter("user_id");
			if (userIdParam != null && !userIdParam.isEmpty()) {
				user_id = Integer.parseInt(userIdParam);
			}
    		String food_type = request.getParameter("food_type");
    		String quantityParam = request.getParameter("quantity");
    		if (quantityParam != null && !quantityParam.isEmpty()) {
    			quantity=Integer.parseInt(quantityParam);
			}
    		String dateString = request.getParameter("available-until"); // assume format is "02 11 2024"
    		SimpleDateFormat inputFormat = new SimpleDateFormat("dd MM yyyy");
    		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
    		java.util.Date parsedDate = inputFormat.parse(dateString);
    		String formattedDate = outputFormat.format(parsedDate);

    		java.sql.Date donationDate = java.sql.Date.valueOf(formattedDate);
    		
    		
    		
    		String query = "insert into Donations (user_id,food_type,quantity,donation_date)  values (?,?,?,?);";
    		pst=con.prepareStatement(query);
    		pst.setInt(1,user_id);
    		pst.setString(2,food_type);
    		pst.setInt(3,quantity);
    		pst.setDate(4,donationDate);
    		int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                response.getWriter().println("Donation added successfully.");
            } else {
                response.getWriter().println("Failed to add donation.");
            }
 
    	}
    }catch(Exception e){
		e.printStackTrace();
	}
	
%>