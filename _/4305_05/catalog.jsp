<%@ page contentType="text/html"%>
<%@ page 
import="java.sql.*,javax.sql.*,java.util.*,javax.naming.*" 
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html">
    <title>WebLogic Application</title>
  </head>
<body>
 <%
    InitialContext ctx=new InitialContext();
    DataSource ds=(DataSource)ctx.lookup("jdbc/OracleDS");
    Connection connection=ds.getConnection();
    Statement stmt=connection.createStatement();
    ResultSet resultSet=stmt.executeQuery("Select * from 
Catalog");%>
    <table border="1" cellspacing="0">
        <tr>
          <th>CatalogId</th>
      <th>Journal</th>
      <th>Publisher</th>
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
