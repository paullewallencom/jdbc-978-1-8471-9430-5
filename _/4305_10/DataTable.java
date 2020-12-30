package datatable;
public class DataTable
{
  private int catalogId;
  private String journal;
  private String publisher;
  private String edition;
  private String title;
  private String author;
  public DataTable()
  {}
  public int getCatalogId(){
    return this.catalogId;}
  public void setCatalogId(int catalogId){
    this.catalogId=catalogId;}
  public String getJournal(){
    return this.journal;}
  public void setJournal(String journal){
    this.journal=journal;}
  public String getPublisher(){
    return this.publisher;}
  public void setPublisher(String publisher){
    this.publisher=publisher;}
  public String getEdition(){
    return this.edition;}
  public void setEdition(String edition){
    this.edition=edition;}
  public String getTitle(){
    return this.title;}
  public void setTitle(String title){
    this.title=title;}
  public String getAuthor(){
    return this.author;}
  public void setAuthor(String author){
    this.author=author;}
  public static void main(String[] args){
    DataTable dataTable = new DataTable();
  }
}
