<%@ page 
contentType="text/html"%>
<%@ page import="java.sql.*,javax.naming.*" %>
<html>
  <head>
    <meta http-equiv="Content-Type" 
content="text/html">
    <title>WebSphere JSP Application</title>
  </head>
<body>
 <%
       InitialContext initialContext = new InitialContext();
    javax.sql.DataSource ds = (javax.sql.DataSource)
    initialContext.lookup("jdbc/DB2DataSource");
   java.sql.Connection conn = ds.getConnection();
    java.sql.Statement stmt = conn.createStatement();
ResultSet resultSet=stmt.executeQuery("Select * from Catalog");%>
    <table border="1" cellspacing="0">
        <tr>
         <th>CatalogId</th>
         <th>Journal</th>
         <th>Section</th>
         <th>Edition</th>
         <th>Title</th>
         <th>Author</th>
        </tr>
      <%
   while (resultSet.next())
         { %>
           <tr>
         <td><%out.println(resultSet.getString(1));%></td>
         <td><%out.println(resultSet.getString(2));%></td>
         <td><%out.println(resultSet.getString(3));%></td>
         <td><%out.println(resultSet.getString(4));%></td>
         <td><%out.println(resultSet.getString(5));%></td>
         <td><%out.println(resultSet.getString(6));%></td>
        </tr>
<% } resultSet.close();stmt.close();connection.close(); %>
        
    </table>
  </body>
</html>
