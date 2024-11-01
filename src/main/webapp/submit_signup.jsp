<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
	final String URL= "jdbc:mysql://localhost:3306/feedingHands";
	final String username="root";
	final String password= "W@2915djkq#";
	Connection con;
	PreparedStatement pst;
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	con=DriverManager.getConnection(URL,username,password);
    	if(con != null){
    		String name=request.getParameter("name");
    		String email=request.getParameter("email");
    		String Password=request.getParameter("password");
    		String address=request.getParameter("address");
    		Long phone=Long.parseLong(request.getParameter("phone"));
    		String role=request.getParameter("role");
    		
    		
    		String query = "insert into signup (name,email,Password,address,phone,role)  values (?,?,?,?,?,?);";
    		pst=con.prepareStatement(query);
    		pst.setString(1,name);
    		pst.setString(2,email);
    		pst.setString(3,Password);
    		pst.setString(4,address);
    		pst.setLong(5, phone);
    		pst.setString(6,role);
    		pst.executeUpdate();
 
    		response.sendRedirect("login.jsp?success=true");
    	}
    }catch(Exception e){
		e.printStackTrace();
	}
	
%>