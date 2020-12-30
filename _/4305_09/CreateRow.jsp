<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page session="true"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Create Row  with Web RowSet</title>
  </head>
  <body>
    <form><h3>Create Row with Web RowSet</h3>
      <table>
       <tr><td><a href="ModifyWebRowSet.jsp">Modify Web RowSet Page</a></td></tr>
      </table>
    </form> 
    <% 
        webrowset.WebRowSetQuery query=null;  
        query=(webrowset.WebRowSetQuery) session.getAttribute("query");
    String journal=request.getParameter("journal");
    String publisher=request.getParameter("publisher"); 
    String edition=request.getParameter("edition");
    String title=request.getParameter("title"); 
    String author=request.getParameter("author");
    if(journal!=null||publisher!=null||edition!=null||title!=null||author!=null){
    query.insertRow(journal, publisher, edition, title, author); 
  
    }
   %>
    <form name="query" action="CreateRow.jsp" method="post">
      <table>
         <tr>
          <td>
            <h4>Insert Row</h4>
          </td>
        </tr>
        <tr>
          <td>Journal:</td>
        </tr>
        <tr>
          <td>
            <input name="journal" type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Publisher:</td>
        </tr>
        <tr>
          <td>
            <input name="publisher" type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Edition:</td>
        </tr>
        <tr>
          <td>
            <input name="edition" type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Title:</td>
        </tr>
        <tr>
          <td>
            <input name="title" type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>Author:</td>
        </tr>
        <tr>
          <td>
            <input name="author" type="text" size="50" maxlength="250"/>
          </td>
        </tr>
        <tr>
          <td>
            <input class="Submit" type="submit" value="Apply"/>
          </td>
        </tr>
      </table></form></body></html>
