<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.io.*, java.util.*, java.sql.Connection,javax.sql.DataSource, javax.naming.InitialContext, 
net.sf.jasperreports.engine.*, net.sf.jasperreports.engine.design.JasperDesign,net.sf.jasperreports.engine.xml.JRXmlLoader" %>
<%InputStream input=new FileInputStream(new File("c:/JasperReports/catalog.xml"));
  JasperDesign design = JRXmlLoader.load(input);
  JasperReport report = JasperCompileManager.compileReport(design);
  Map parameters = new HashMap();
  parameters.put("ReportTitle", "PDF JasperReport");
    InitialContext initialContext = new InitialContext();
    DataSource ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/JasperReportsDS");
    Connection conn = ds.getConnection();
    JasperPrint print = JasperFillManager.fillReport(report, 
     parameters, conn);
    OutputStream output=new FileOutputStream(new File("c:/JasperReports/catalog.pdf"));
    JasperExportManager.exportReportToPdfStream(print, output);%>
