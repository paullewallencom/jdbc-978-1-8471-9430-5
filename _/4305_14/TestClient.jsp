<%@ page 
contentType="text/html;charset=windows-1252"%>
<%@ page import="oracle.jbo.*, 
oracle.jbo.client.Configuration" %>
<html>
  <head>
    <meta http-equiv="Content-Type" 
content="text/html; charset=windows-1252">
    <title>BC4J Web Application</title>
  </head>
  <body>
  <%
  String appModule = "model.AppModule"; //App Module name
  String cfg="AppModuleLocal";//Config Name
  String viewObject = "CatalogView1"; //name of view object
 ApplicationModule applicationModule =
(ApplicationModule)Configuration.createRootApplicationModule(appModule, cfg);
   //Establish connection with database
   Transaction 
transaction=applicationModule.getTransaction();
   if(transaction.isConnected()==false)
   transaction.connect("jdbc:oracle:thin:@localhost:1521:ORCL", "OE", "pw");
  // Find the viewobject included in the appmodule
    ViewObject vo = 
appl icationModule.findViewObject(viewObject);
%>
   <table border="1" cellspacing="0">
        <tr>
         <th>CatalogId</th>
         <th>Journal</th>
         <th>Publisher</th>
         <th>Edition</th>
         <th>Section</th>
         <th>Title</th>
         <th>Author</th>
        </tr>
        <%  Row row = vo.first();
            while (row != null)
         {  int i=0;
            
            %><tr>
         <td><% out.println(row.getAttribute(i++).toString());%></td>
         <td><%out.println(row.getAttribute(i++).toString());%></td>
         <td><%out.println(row.getAttribute(i++).toString());%></td>
         <td><%out.println(row.getAttribute(i++).toString());%></td>
         <td><%out.println(row.getAttribute(i++).toString());%></td>
         <td><% out.println(row.getAttribute(i++).toString());%></td>
         <td><%out.println(row.getAttribute(i).toString());%></td>
        </tr>
          <%     
            
            row = vo.next();             
         } %>
    </table>
  <%
Configuration.releaseRootApplicationModule(applicationModule, true);
 %> 
  </body>
</html>
