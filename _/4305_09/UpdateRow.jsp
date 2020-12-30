<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page session="true"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Update Row in Database Table with Web RowSet</title>
  </head>
  <body>
    <form><h3>Update Row in Database Table with Web RowSet</h3>
      <table>
      <tr><td><a href="ModifyWebRowSet.jsp">Modify Web RowSet Page</a></td></tr></table>
    </form> 
    <% 
webrowset.WebRowSetQuery query=null;
        query=( webrowset.WebRowSetQuery) session.getAttribute("query");
    String rowUpdate=request.getParameter("rowUpdate");
    String journalUpdate=request.getParameter("journalUpdate"); 
    String publisherUpdate=request.getParameter("publisherUpdate"); 
    String editionUpdate=request.getParameter("editionUpdate");
    String titleUpdate=request.getParameter("titleUpdate"); 
    String authorUpdate=request.getParameter("authorUpdate"); 
        if((rowUpdate!=null)){
        System.out.println(rowUpdate +"Row to Update");
    int row_Update=Integer.parseInt(rowUpdate);
    query.updateRow(row_Update, journalUpdate, publisherUpdate, editionUpdate, titleUpdate, authorUpdate);
   } 
   %>
    <form name="query" action="UpdateRow.jsp" method="post">
      <table>
        <tr>
          <td>Database Row to Update:</td>
        </tr>
        <tr>
          <td>
            <input name="rowUpdate" type="text" size="25" maxlength="50"/>
          </td>
        </tr>
        <tr>
          <td>Journal:</td>
        </tr>
        <tr>
          <td>
            <input name="journalUpdate" type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Publisher:</td>
        </tr>
        <tr>
          <td>
            <input name="publisherUpdate" type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Edition:</td>
        </tr>
        <tr>
          <td>
            <input name="editionUpdate" type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Title:</td>
        </tr>
        <tr>
          <td>
            <input name="titleUpdate" type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Author:</td>
        </tr>
        <tr>
          <td>
            <input name="authorUpdate" type="text" size="50" maxlength="250"/>
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
