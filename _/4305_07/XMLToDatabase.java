package xsu;

import oracle.xml.sql.query.OracleXMLQuery;
import oracle.xml.sql.dml.OracleXMLSave;
import java.sql.*;
import java.io.*;

public class XMLToDatabase {
    public void xmlToSQL(Connection conn) {
        try {
            OracleXMLSave oracleXMLSave = new OracleXMLSave(conn, "JOURNAL");
            String[] keyColNames = new String[1];
            keyColNames[0] = "CATALOGID";
            oracleXMLSave.setKeyColumnList(keyColNames);
            /*Reader xsltReader=new FileReader(new File("input.xsl"));*/
            oracleXMLSave.setXSLT("input.xsl", null);
            oracleXMLSave.setIgnoreCase(true);
            oracleXMLSave.setRowTag("journal");
            InputStream input = new FileInputStream(new File("catalog.xml"));
            oracleXMLSave.insertXML(input);
            oracleXMLSave.close();
        } catch (IOException e) {
            System.out.println("IOException" + e.getMessage());
        }
    }

    public void updateDatabase(Connection conn) {
        try {
            OracleXMLSave oracleXMLSave = new OracleXMLSave(conn, "JOURNAL");
            oracleXMLSave.setRowTag("journal");
            oracleXMLSave.setIgnoreCase(true);
            String[] keyColNames = new String[1];
            keyColNames[0] = "CATALOGID";
            oracleXMLSave.setKeyColumnList(keyColNames);
            String[] updateColNames = new String[2];
            updateColNames[0] = "EDITION";
            updateColNames[1] = "TITLE";
            oracleXMLSave.setUpdateColumnList(updateColNames);
            InputStream input = 
                new FileInputStream(new File("catalog-update.xml"));
            oracleXMLSave.updateXML(input);
            oracleXMLSave.close();
        } catch (IOException e) {
            System.out.println("IOException" + e.getMessage());
        }
    }

    public void deleteRow(Connection conn) {
        try {
            OracleXMLSave oracleXMLSave = new OracleXMLSave(conn, "JOURNAL");
            oracleXMLSave.setRowTag("journal");
            oracleXMLSave.setIgnoreCase(true);
            String[] keyColNames = new String[1];
            keyColNames[0] = "CATALOGID";
            oracleXMLSave.setKeyColumnList(keyColNames);
            InputStream input = 
                new FileInputStream(new File("catalog-delete.xml"));
            oracleXMLSave.deleteXML(input);
            oracleXMLSave.close();
        } catch (IOException e) {
            System.out.println("IOException" + e.getMessage());
        }
    }

    public void sqlToXML(Connection conn) {
        try {
            OracleXMLQuery query = 
                new OracleXMLQuery(conn, "SELECT CATALOGID, JOURNAL_TITLE, PUBLISHER, EDITION, ARTICLE_SECTION, TITLE, AUTHOR FROM JOURNAL");
            Reader xsltReader = new FileReader(new File("output.xsl"));
            query.setXSLT(xsltReader, null);
            query.setRowTag("journal");
            String xmlString = query.getXMLString();
            OutputStream output = 
                new FileOutputStream(new File("catalog-output.xml"));
            PrintWriter printWriter = new PrintWriter(output);
            printWriter.print(xmlString);
            printWriter.flush();
        } catch (IOException e) {
            System.out.println("IOException" + e.getMessage());
        }
    }

    public static void main(String[] args) {
        try {

            Connection conn = 
                DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", 
                                            "OE", "calgary");
            XMLToDatabase xmlToDB = new XMLToDatabase();
           /* xmlToDB.xmlToSQL(conn);
            xmlToDB.updateDatabase(conn);
       xmlToDB.deleteRow(conn);*/
        xmlToDB.sqlToXML(conn);
          conn.close();
        } catch (SQLException exception) {
            for (Throwable e: exception) {
                System.out.println("Error encountered: " + e);
            }
        }
    }
}
