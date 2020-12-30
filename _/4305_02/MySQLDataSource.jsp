<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page language="java" import="java.sql.*, javax.naming.*, javax.sql.*" %> 
<%
InitialContext initialContext = new InitialContext();
DataSource ds = (DataSource)
initialContext.lookup("java:comp/env/jdbc/MySQLDS");
java.sql.Connection connection = ds.getConnection();
Statement stmt=connection.createStatement();
ResultSet resultSet=stmt.executeQuery("Select * from Catalog");%>
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
<%}%>
</table>
<%
resultSet.close();
stmt.close();
if(!connection.isClosed())
connection.close();%>
