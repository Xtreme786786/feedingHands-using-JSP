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
    		String message=request.getParameter("message");
    		
    		String query = "insert into enquiry (name,email,message)  values (?,?,?);";
    		pst=con.prepareStatement(query);
    		pst.setString(1,name);
    		pst.setString(2,email);
    		pst.setString(3,message);
    		pst.executeUpdate();
    		
    		response.sendRedirect("index.jsp?success=true");
    	}
    }catch(Exception e){
		e.printStackTrace();
	}
	
%>
	
	
