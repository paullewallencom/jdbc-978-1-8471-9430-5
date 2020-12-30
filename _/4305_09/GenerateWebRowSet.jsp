<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Generate WebRowSet</title>
  </head>
  <body>
    <form>
    </form> 
    <%  String selectQuery=request.getParameter("selectQuery"); 
    webrowset.WebRowSetQuery query=new webrowset.WebRowSetQuery(); 
    if(selectQuery!=null){
    query.generateWebRowSet(selectQuery);
    query.generateXMLDocument();
 }
   %>
    <form name="query" action="GenerateWebRowSet.jsp" method="post">
      <table>
        <tr>
          <td>Select Query:</td>
        </tr><tr><td>
            <textarea name="selectQuery" rows="5" cols="50"></textarea>
          </td>
        </tr><tr><td>
            <input class="Submit" type="submit" value="Apply"/>
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
