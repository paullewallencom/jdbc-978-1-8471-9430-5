<%@ page 
contentType="text/html"%>
<%@ page import="java.sql.*,javax.naming.*, com.ibm.db2.jcc.DB2Statement " %>
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

connection.setClientInfo("ApplicationName","WebSphereApp");
connection.setClientInfo("ClientUser","WebSphereUser");
connection.setClientInfo("ClientHostname","WebSphereHost");

    java.sql.Statement stmt = conn.createStatement();
DatabaseMetaData metaData=connection.getMetaData();
if(metaData.supportsStatementPooling()){
if(stmt.isPoolable())
stmt.setPoolable(true);
}
Class class = Class.forName("com.ibm.db2.jcc.DB2Statement");
if(stmt.isWrapperFor(class)) {
com.ibm.db2.jcc.DB2Statement  db2Stmt = (com.ibm.db2.jcc.DB2Statement)stmt.unwrap(class);
db2Stmt.setDB2ClientProgramId("WebSphereprogram");

ResultSet resultSet=db2Stmt.executeQuery("Select ROWID, CATALOGID, JOURNAL, PUBLISHER, EDITION, TITLE, AUTHOR from Catalog");%>
    <table border="1" cellspacing="0">
        <tr>
        <th>RowId</th>
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
