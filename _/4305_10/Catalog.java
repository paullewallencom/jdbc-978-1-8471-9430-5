package datatable.backing;
import javax.faces.component.html.HtmlCommandButton;
import javax.faces.component.html.HtmlDataTable;
import javax.faces.component.html.HtmlForm;
import javax.faces.component.html.HtmlInputText;
import javax.faces.component.UIColumn;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.context.FacesContext;
import javax.faces.el.ValueBinding;
import javax.faces.model.ResultSetDataModel;
import java.sql.*;
public class Catalog {
    private HtmlForm form1;
    private HtmlInputText inputText1;
    private HtmlCommandButton commandButton1;
    private HtmlDataTable dataTable1;
    private UIColumn column1;
    private UIColumn column2;
    private UIColumn column3;
    private UIColumn column4;
    private UIColumn column5;
    private UIColumn column6;
    public void setForm1(HtmlForm form1) {
        this.form1 = form1;
    }
    public HtmlForm getForm1() {
        return form1;
    }
    public void setInputText1(HtmlInputText inputText1) {
        this.inputText1 = inputText1;
    }
    public HtmlInputText getInputText1() {
        return inputText1;
    }
    public void setCommandButton1(HtmlCommandButton commandButton1) {
        this.commandButton1 = commandButton1;
    }
    public HtmlCommandButton getCommandButton1() {
        return commandButton1;
    }
    public void setDataTable1(HtmlDataTable dataTable1) {
        this.dataTable1 = dataTable1;
    }
    public HtmlDataTable getDataTable1() {
        return dataTable1;
    }
    public void setColumn1(UIColumn column1) {
        this.column1 = column1;
    }
    public UIColumn getColumn1() {
        return column1;
    }
    public void setColumn2(UIColumn column2) {
        this.column2 = column2;
    }
    public UIColumn getColumn2() {
        return column2;
    }
    public void setColumn3(UIColumn column3) {
        this.column3 = column3;
    }
    public UIColumn getColumn3() {
        return column3;
    }
    public void setColumn4(UIColumn column4) {
        this.column4 = column4;
    }
    public UIColumn getColumn4() {
        return column4;
    }
    public void setColumn5(UIColumn column5) {
        this.column5 = column5;
    }
    public UIColumn getColumn5() {
        return column5;
    }
    public void setColumn6(UIColumn column6) {
        this.column6 = column6;
    }
    public UIColumn getColumn6() {
        return column6;
    }
    public String commandButton1_action()
      {
        // Add event code here...
        ResultSet rs=null;
        try{
        Class.forName("oracle.jdbc.OracleDriver");
    String url="jdbc:oracle:thin:@localhost:1521:ORCL";
    Connection connection = DriverManager.getConnection(url,
                         "OE", "pw");
    Statement stmt=connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
     rs=stmt.executeQuery((String)inputText1.getValue());
     dataTable1.setBorder(5);
     dataTable1.setCellpadding("1"); 
     dataTable1.setVar("catalog");
    HtmlOutputText headerComponent = new HtmlOutputText();
        headerComponent.setValue("CatalogId");
        column1.setHeader(headerComponent);
     headerComponent = new HtmlOutputText();
        headerComponent.setValue("Journal");
        column2.setHeader(headerComponent);
     headerComponent = new HtmlOutputText();
        headerComponent.setValue("Publisher");
        column3.setHeader(headerComponent);
     headerComponent = new HtmlOutputText();
        headerComponent.setValue("Edition");
        column4.setHeader(headerComponent);
     headerComponent = new HtmlOutputText();
        headerComponent.setValue("Title");
        column5.setHeader(headerComponent);
     headerComponent = new HtmlOutputText();
        headerComponent.setValue("Author");
        column6.setHeader(headerComponent);
    HtmlOutputText column1Text=new HtmlOutputText();
    ValueBinding vb = 
FacesContext.getCurrentInstance().getApplication().createValueBinding("#{catalog.catalogid}");
    column1Text.setValueBinding("value", vb);
    column1.getChildren().add(column1Text);
    HtmlOutputText column2Text=new HtmlOutputText();
     vb = 
FacesContext.getCurrentInstance().getApplication().createValueBinding("#{catalog.journal}");
    column2Text.setValueBinding("value", vb);
    column2.getChildren().add(column2Text);
    HtmlOutputText column3Text=new HtmlOutputText();
     vb = 
FacesContext.getCurrentInstance().getApplication().createValueBinding("#{catalog.publisher}");
    column3Text.setValueBinding("value", vb);
    column3.getChildren().add(column3Text);
    HtmlOutputText column4Text=new HtmlOutputText();
     vb = 
FacesContext.getCurrentInstance().getApplication().createValueBinding("#{catalog.edition}");
    column4Text.setValueBinding("value", vb);
    column4.getChildren().add(column4Text);
    HtmlOutputText column5Text=new HtmlOutputText();
     vb = FacesContext.getCurrentInstance().getApplication().createValueBinding("#{catalog.title}");
    column5Text.setValueBinding("value", vb);
    column5.getChildren().add(column5Text);
    HtmlOutputText column6Text=new HtmlOutputText();
     vb = FacesContext.getCurrentInstance().getApplication().createValueBinding("#{catalog.author}");
    column6Text.setValueBinding("value", vb);
    column6.getChildren().add(column6Text);
    ResultSetDataModel dataModel=new ResultSetDataModel();
    dataModel.setWrappedData(rs);
    dataTable1.setValue(dataModel);
    rs.close();
    stmt.close();
    connection.close();
    }
     catch(SQLException e){System.out.println(e.getMessage());}
     catch(ClassNotFoundException e){ System.out.println(e.getMessage());}
        return null;
      }}
