<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page language="java" import="java.sql.*, javax.naming.*, javax.sql.*,oracle.jdbc.*" %>
<%@ page errorPage="errorpage.jsp" %>
<%
    InitialContext initialContext = new InitialContext();
    DataSource ds = (DataSource)
    initialContext.lookup("java:comp/env/jdbc/OracleDS");
   java.sql.Connection connection = ds.getConnection();
connection.setClientInfo("ApplicationName","DataDirectApp");
connection.setClientInfo("ClientUser","DataDirect");
connection.setClientInfo("ClientHostname","DataDirectHost");
 Statement stmt=connection.createStatement();
DatabaseMetaData metaData=connection.getMetaData();
if(metaData.supportsStatementPooling()){
if(stmt.isPoolable())
stmt.setPoolable(true);
}
OracleStatement oracleStmt=null;
Class class = Class.forName("oracle.jdbc.OracleStatement");
if(stmt.isWrapperFor(class)) {
oracleStmt = (OracleStatement)stmt.unwrap(class);
oracleStmt.defineColumnType(1, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(2, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(3, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(4, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(5, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(6, OracleTypes.VARCHAR);
oracleStmt.defineColumnType(7, OracleTypes.VARCHAR);
oracleStmt.setRowPrefetch(2);
}
    ResultSet resultSet=oracleStmt.executeQuery("Select ROWID, CATALOGID, JOURNAL, PUBLISHER, EDITION, TITLE, AUTHOR from Catalog");%>
    <table border="1" cellspacing="0">
        <tr>
          <th>Row Id</th>
          <th>Catalog Id</th>
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
    <% } %>
    </table>
  <%
    resultSet.close();
    oracleStmt.close();
    if(!connection.isClosed())
    connection.close();%>   
