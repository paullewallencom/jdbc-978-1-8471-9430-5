<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>catalogUpdate</title>
  </head>
  <body>
  <sql:setDataSource driver="oracle.jdbc.OracleDriver"  
url="jdbc:oracle:thin:@localhost:1521:ORCL"  user="oe" 
password="pw"/>
<sql:update  sql="UPDATE OE.CATALOG SET TITLE=?, AUTHOR=? 
WHERE CATALOGID=?">
<sql:param value="Introduction to ADF"/>
<sql:param value="Muench, Steve"/>
<sql:param value="catalog3"/>
    </sql:update>
</body>
</html>

