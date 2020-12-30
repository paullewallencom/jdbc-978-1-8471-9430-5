<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="org.apache.poi.hssf.usermodel.*, java.sql.*, java.io.*,javax.naming.InitialContext"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;  charset=windows-1252">
    <title>untitled</title>
  </head>
  <body><%HSSFWorkbook wb=new HSSFWorkbook();
HSSFSheet sheet1=wb.createSheet("sheet1");
InitialContext initialContext = new InitialContext();
    javax.sql.DataSource ds = (javax.sql.DataSource)
    initialContext.lookup("java:comp/env/jdbc/ApachePOIConnectionDS ");
   java.sql.Connection conn = ds.getConnection();
Statement stmt=conn.createStatement();
ResultSet resultSet=stmt.executeQuery("Select * from Catalog");
HSSFRow row=sheet1.createRow(0);
row.createCell((short)0).setCellValue("CatalogId");
row.createCell((short)1).setCellValue("Journal");
row.createCell((short)2).setCellValue("Publisher");
row.createCell((short)3).setCellValue("Edition");
row.createCell((short)4).setCellValue("Title");
row.createCell((short)5).setCellValue("Author");
   for (int i=1;resultSet.next(); i++)
         { 
 row=sheet1.createRow(i);
row.createCell((short)0).setCellValue(resultSet.getString(1));
row.createCell((short)1).setCellValue(resultSet.getString(2));
row.createCell((short)2).setCellValue(resultSet.getString(3));
row.createCell((short)3).setCellValue(resultSet.getString(4));
row.createCell((short)4).setCellValue(resultSet.getString(5));
row.createCell((short)5).setCellValue(resultSet.getString(6));
}
FileOutputStream output=new FileOutputStream(new File("c:/excel/catalog.xls"));
wb.write(output);
output.close();
resultSet.close();
stmt.close();
conn.close();
%>
  </body>
</html>