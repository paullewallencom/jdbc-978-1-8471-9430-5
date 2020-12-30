<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>catalog</title>
  </head>
  <body><sql:setDataSource driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:ORCL" user="OE" password="pw"/>
  <sql:transaction>
<sql:update   sql="CREATE TABLE OE.Catalog(CatalogId VARCHAR(25) 
PRIMARY KEY, Journal VARCHAR(25), Publisher VARCHAR(25),
 Edition VARCHAR(25), Title Varchar(45), Author Varchar(25))">
</sql:update>
<sql:update   sql="INSERT INTO OE.Catalog VALUES('catalog1', 'Oracle Magazine', 'Oracle Publishing', 'Nov-Dec 2004', 'Database Resource Manager', 'Kimberly 
Floss')">
</sql:update>
<sql:update  sql="INSERT INTO OE.Catalog VALUES('catalog2', 'Oracle Magazine', 'Oracle Publishing', 'Nov-Dec 2004', 'From ADF UIX to JSF', 'Jonas Jacobi')">
</sql:update>
<sql:update   sql="INSERT INTO OE.Catalog VALUES('catalog3', 'Oracle Magazine', 
'Oracle Publishing','March-April 2005','Starting with Oracle ADF', 'Steve Muench')">
</sql:update>
    </sql:transaction>
<%out.println("Database Table Created");%>
  </body>
</html>
