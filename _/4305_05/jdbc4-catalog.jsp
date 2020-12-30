<%@ page contentType="text/html"%>
<%@ page 
import="java.sql.*,javax.sql.*,java.util.*,javax.naming.*, oracle.jdbc.OracleStatement" 
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
connection.setClientInfo("ApplicationName","OracleApp");
connection.setClientInfo("ClientUser","OracleUser");
connection.setClientInfo("ClientHostname","OracleHost");
    Statement stmt=connection.createStatement();
DatabaseMetaData metaData=connection.getMetaData();
if(metaData.supportsStatementPooling()){
if(stmt.isPoolable())
stmt.setPoolable(true);
}
Class class = Class.forName("oracle.jdbc.OracleStatement");
if(stmt.isWrapperFor(class)) {
OracleStatement oracleStmt = (OracleStatement)stmt.unwrap(class);
oracleStmt.clearDefines();
oracleStmt.defineColumnType(1, OracleTypes.NUMBER);
oracleStmt.defineColumnType(2, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(3, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(4, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(5, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(6, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(7, OracleTypes.VARCHAR);
    ResultSet resultSet=oracleStmt.executeQuery("Select ROWID, CATALOGID, JOURNAL, PUBLISHER, EDITION, TITLE, AUTHOR from Catalog");%>
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
<td><%out.println(resultSet.getRowId("ROWID").toString());%></td>
<td><%out.println(resultSet.getString(1));%></td>
<td><%out.println(resultSet.getString(2));%></td>
<td><%out.println(resultSet.getString(3));%></td>
<td><%out.println(resultSet.getString(4));%></td>
<td><%out.println(resultSet.getString(5));%></td>
<td><%out.println(resultSet.getString(6));%></td>
        </tr>
    <% } 
resultSet.close();
stmt.close();
connection.close();
}%>
    </table>
  </body>
</html>
