<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page session="true"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Delete Database Table Row with Web RowSet</title>
  </head>
  <body>
    <form><h3>Delete Database Table Row with Web RowSet</h3>
      <table>
    <tr><td><a href="ModifyWebRowSet.jsp">Modify Web RowSet Page</a></td></tr></table>
    </form> 
    <% 
        webrowset.WebRowSetQuery query=null;
        query=( webrowset.WebRowSetQuery)session.getAttribute("query");
        String deleteRow=request.getParameter("deleteRow");
    if((deleteRow!=null)){
   int delete_Row=Integer.parseInt(deleteRow); 
    query.deleteRow(delete_Row);
    }
   %>
    <form name="query" action="DeleteRow.jsp" method="post">
      <table>
        <tr>
          <td><h4>Delete Row</h4></td>
        </tr>
        <tr>
          <td>
            <input name="deleteRow" type="text" size="25" maxlength="50"/>
          </td>
        </tr>
        <tr>
          <td>
            <input class="Submit" type="submit" value="Apply"/>
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
