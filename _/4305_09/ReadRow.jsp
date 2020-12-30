<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page session="true"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Read Row with Web RowSet</title>
  </head>
  <body>
    <form><h3>Read Row  with Web RowSet</h3>
      <table>
      <tr><td><a href="ModifyWebRowSet.jsp">Modify Web RowSet Page</a></td></tr></table>
    </form> 
    <% 
        webrowset.WebRowSetQuery query=null;
        query=( webrowset.WebRowSetQuery) session.getAttribute("query");
    String rowRead=request.getParameter("rowRead");
    String journalUpdate=request.getParameter("journalUpdate"); 
    String publisherUpdate=request.getParameter("publisherUpdate"); 
    String editionUpdate=request.getParameter("editionUpdate");
    String titleUpdate=request.getParameter("titleUpdate"); 
    String authorUpdate=request.getParameter("authorUpdate"); 
        if((rowRead!=null)){
    int row_Read=Integer.parseInt(rowRead);
    String[] resultSet=query.readRow(row_Read);
journalUpdate=resultSet[0];
publisherUpdate=resultSet[1];
  editionUpdate=resultSet[2];
titleUpdate=resultSet[3];
authorUpdate=resultSet[4];
   } 
   %>
    <form name="query" action="ReadRow.jsp" method="post">
      <table>
        <tr>
          <td>Database Row to Read:</td>
        </tr>
        <tr>
          <td>
            <input name="rowRead"  type="text" size="25" maxlength="50"/>
          </td>
        </tr>
        <tr>
          <td>Journal:</td>
        </tr>
        <tr>
          <td>
            <input name="journalUpdate" value='<%=journalUpdate%>' type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Publisher:</td>
        </tr>
        <tr>
          <td>
            <input name="publisherUpdate" value='<%=publisherUpdate%>' type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Edition:</td>
        </tr>
        <tr>
          <td>
            <input name="editionUpdate" value='<%=editionUpdate%>' type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Title:</td>
        </tr>
        <tr>
          <td>
            <input name="titleUpdate" value='<%=titleUpdate%>' type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Author:</td>
        </tr>
        <tr>
          <td>
            <input name="authorUpdate" value='<%=authorUpdate%>' type="text" size="50" maxlength="250"/>
          </td>
        </tr><tr>
          <td>
            <input class="Submit" type="submit" value="Apply"/>
          </td>
        </tr>
      </table>
    </form>
  </body></html>
