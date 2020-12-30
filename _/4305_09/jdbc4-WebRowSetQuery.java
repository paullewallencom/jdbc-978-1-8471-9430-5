package webrowset;

import oracle.jdbc.rowset.*;
import java.io.*;
import java.sql.SQLException;


public class WebRowSetQuery {

    public OracleWebRowSet webRowSet;
    public String selectQuery;

    public WebRowSetQuery() {
    }
    public WebRowSetQuery(OracleWebRowSet webRowSet) {
        this.webRowSet = webRowSet;
    }
    public void generateWebRowSet(String selectQuery) {
        try {
            webRowSet = new OracleWebRowSet();
            webRowSet.setDataSourceName("jdbc/OracleDataSource");
            webRowSet.setCommand(selectQuery);
            webRowSet.setUsername("oe");
            webRowSet.setPassword("pw");
            webRowSet.setReadOnly(false);
            webRowSet.setFetchSize(5);
            webRowSet.setMaxRows(3);
            webRowSet.execute();
            
        } catch (SQLException sqlException) {
            for (Throwable e: sqlException) {
                System.out.println("Error encountered: " + e);
            }
        }
    }
    public void generateXMLDocument() {
        try {
            OutputStreamWriter output = 
                new OutputStreamWriter(new FileOutputStream(new File("c:/output/output.xml")));
            webRowSet.writeXml(output);
        } catch (SQLException sqlException) {
            for (Throwable e: sqlException) {
                System.out.println("Error encountered: " + e);
            }
        }

        catch (IOException e) {
        }
    }

    public void deleteRow(int row) {
        try {
            webRowSet.absolute(row);
            webRowSet.deleteRow();
        } catch (SQLException sqlException) {
            for (Throwable e: sqlException) {
                System.out.println("Error encountered: " + e);
            }
        }
    }
public void insertRow(String journal, String publisher, String edition, 
                          String title, String author) {
        try {
            webRowSet.moveToInsertRow();
            webRowSet.updateString(1, journal);
            webRowSet.updateString(2, publisher);
            webRowSet.updateString(3, edition);
            webRowSet.updateString(4, title);
            webRowSet.updateString(5, author);
            webRowSet.insertRow();
        } catch (SQLException sqlException) {
            for (Throwable e: sqlException) {
                System.out.println("Error encountered: " + e);
            }
        }
    }
public void updateRow(int rowUpdate, String journal, String publisher, 
                          String edition, String title, String author) {
        try {
            webRowSet.absolute(rowUpdate);
            webRowSet.updateString(1, journal);
            webRowSet.updateString(2, publisher);
            webRowSet.updateString(3, edition);
            webRowSet.updateString(4, title);
            webRowSet.updateString(5, author);
            webRowSet.updateRow();
        } catch (SQLException sqlException) {
            for (Throwable e: sqlException) {
                System.out.println("Error encountered: " + e);
            }
        }
    }
    public String[] readRow(int rowRead) {
        String[] resultSet = null;
        try {
            resultSet = new String[5];
            webRowSet.absolute(rowRead);
            resultSet[0] = webRowSet.getString(1);
            resultSet[1] = webRowSet.getString(2);
            resultSet[2] = webRowSet.getString(3);
            resultSet[3] = webRowSet.getString(4);
            resultSet[4] = webRowSet.getString(5);
        } catch (SQLException sqlException) {
            for (Throwable e: sqlException) {
                System.out.println("Error encountered: " + e);
            }
        }
        return resultSet;
    }
    public void updateDatabase() {
        try {
            webRowSet.acceptChanges();
        } catch (SQLException sqlException) {
            for (Throwable e: sqlException) {
                System.out.println("Error encountered: " + e);
            }
        }
    }
}

