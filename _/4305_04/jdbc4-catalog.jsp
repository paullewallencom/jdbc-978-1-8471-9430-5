<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page language="java" import="java.sql.*, javax.naming.*, javax.sql.*,oracle.jdbc.*" %>
<%@ page errorPage="errorpage.jsp" %>
<%
    InitialContext initialContext = new InitialContext();
    DataSource ds = (DataSource)
    initialContext.lookup("java:/MySqlDS");
   java.sql.Connection connection = ds.getConnection();
connection.setClientInfo("ApplicationName","JBossApp");
connection.setClientInfo("ClientUser","JBossUser");
connection.setClientInfo("ClientHostname","JBossHost");

Class class = Class.forName("com.mysql.jdbc.Connection");
if(connection.isWrapperFor(class)) {
com.mysql.jdbc.Connection conn= (com.mysql.jdbc.Connection)connection.unwrap(class);
conn.setClientInfo("ApplicationName","JBossApp");
conn.setClientInfo("ClientUser","JBossUser");
conn.setClientInfo("ClientHostname","JBossHost");

String sql="SELECT CATALOGID, JOURNAL, PUBLISHER, EDITION, TITLE, AUTHOR from Catalog WHERE CATALOGID=?";
PreparedStatement pstmt=conn.clientPrepareStatement(sql);
pstmt.setString(1, "catalog1");
ResultSet rs=pstmt.executeQuery();

    %>
    <table border="1" cellspacing="0">
        <tr>
          
          <th>Catalog Id</th>
          <th>Journal</th>
         <th>Publisher</th>
         <th>Edition</th>
         <th>Title</th>
         <th>Author</th>
        </tr>
      <%
   while (rs.next())
        { %>
         <tr>
          
          <td><%out.println(resultSet.getString(1));%></td>
          <td><%out.println(resultSet.getString(2));%></td>
          <td><%out.println(resultSet.getString(3));%></td>
          <td><%out.println(resultSet.getString(4));%></td>
          <td><%out.println(resultSet.getString(5));%></td>
          <td><%out.println(resultSet.getString(6));%></td>
        </tr>
    <% } %>
    </table>
  <%
    rs.close();
    pstmt.close();
    if(!connection.isClosed())
    connection.close();}%>   
