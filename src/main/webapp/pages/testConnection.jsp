<%@ page import="java.sql.*" %>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "root");
        out.println("<h3>Database Connected Successfully!</h3>");
        conn.close();
    } catch (Exception e) {
        out.println("<h3>Database Connection Failed!</h3>");
        e.printStackTrace();
    }
%>
