<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
	final String URL= "jdbc:mysql://localhost:3306/feedingHands";
	final String username="root";
	final String password= "W@2915djkq#";
	Connection con;
	PreparedStatement pst;
	ResultSet rst;
	
	String email = request.getParameter("email");
	String Password = request.getParameter("password");
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	con=DriverManager.getConnection(URL,username,password);
    	if(con != null){
    		
    		
    		String query = "select role,name,user_id from signup where email=? AND password =?";
    		pst=con.prepareStatement(query);
    		pst.setString(1,email);
    		pst.setString(2,Password);
    		rst=pst.executeQuery();
    		if(rst.next()){
    			String name = rst.getString("name");
    			String role = rst.getString("role");
    			int user_id = rst.getInt("user_id");
    			if (role.equals("Donor")) {
                    response.sendRedirect("donor_dashboard.jsp?name="+name+"&user_id="+user_id); 
                } else if (role.equals("Charity")) {
                    response.sendRedirect("requester_dashboard.jsp?name="+name+"&user_id="+user_id); 
                }
            } else {
                out.println("<script>alert('Invalid email or password!'); window.location='login.jsp';</script>");
            }
    	}
    }catch(Exception e){
		e.printStackTrace();
	}
	
%>