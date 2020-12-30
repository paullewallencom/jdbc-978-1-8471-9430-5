<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page session="true"%>
<html>
  <head>
    <title>Modify Database Table with Web RowSet</title>
  </head>
  <body>
    <h3>Modify Database Table with Web RowSet</h3>
      <%webrowset.WebRowSetQuery query=null;%>
    <%String selectQuery=request.getParameter("selectQuery");
    if(selectQuery!=null)
    query=new webrowset.WebRowSetQuery(); 
    query.generateWebRowSet(selectQuery);
    session.setAttribute("query", query);
    } 
%>
    <form name="query" action="ModifyWebRowSet.jsp" method="post">
       <table>
        <tr>
          <td>Select Query:</td>
        </tr><tr><td>
            <textarea name="selectQuery" rows="5" cols="50"></textarea>
          </td></tr><tr><td>
            <input class="Submit" type="submit" value="Apply Query"/>
          </td></tr>
      <tr><td><a href="CreateRow.jsp">Create Row</a></td></tr>
      <tr><td><a href="ReadRow.jsp">Read Row</a></td></tr>
      <tr><td><a href="UpdateRow.jsp">Update Row</a></td></tr>
       <tr><td><a href="DeleteRow.jsp">Delete Row</a></td></tr>
       <tr><td><a href="UpdateDatabase.jsp">Update Database</a></td></tr>
      </table>
    </form>
  </body>
</html>
