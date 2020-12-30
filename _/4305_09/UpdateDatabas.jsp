<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page session="true"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; 
charset=windows-1252">
    <title>Update Database Table with Web RowSet</title>
  </head>
  <body>
    <h3>Update Database Table with Web RowSet</h3>
      <% webrowset.WebRowSetQuery query=null;%>
    <% 
        String 
updateDatabase=request.getParameter("updateDatabase");
        if(updateDatabase!=null)
        query 
=( webrowset.WebRowSetQuery)session.getAttribute("query");
        if(query!=null){
        query.updateDatabase();
    query.generateXMLDocument();}
%>
   <form name="query" action="UpdateDatabase.jsp" 
method="post">
   <input type="hidden" name="updateDatabase" value="Update 
Database"/>
       <table>
        <tr>
          <td>Update Database
          </td>
      </tr>
      <tr>
          <td>
            <input class="Submit" type="submit" 
value="Apply"/>
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
