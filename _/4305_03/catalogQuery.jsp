<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>catalogQuery</title>
  </head>
  <body><sql:setDataSource driver="oracle.jdbc.OracleDriver"  
url="jdbc:oracle:thin:@localhost:1521:ORCL"  user="oe" 
password="pw"/><sql:query var="catalog" sql="SELECT * FROM OE.CATALOG"/>
<table border>
<tr>
<td><b>CatalogId</b></td>
<td><b>Journal</b></td>
<td><b>Publisher</b></td>
<td><b>Edition</b></td>
<td><b>Title</b></td>
<td><b>Author</b></td>
</tr>
<c:forEach var="journal" items="${catalog.rows}">
<tr><td>
            <c:out value="${journal.CatalogId}"/>
          </td> <td><c:out value="${journal.Journal}"/></td>
<td><c:out value="${journal.Publisher}"/></td>
<td><c:out value="${journal.Edition}"/></td>
<td><c:out value="${journal.Title}"/></td>
<td><c:out value="${journal.Author}"/></td>
 </tr>
</c:forEach>
    </table>
</body>
</html>

