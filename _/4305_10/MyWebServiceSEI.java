package datatable;
import java.rmi.RemoteException;
public interface MyWebService1SEI extends java.rmi.Remote
{   public java.lang.String getTitle() throws RemoteException;
    public void setTitle(java.lang.String param0) throws RemoteException;
    public int getCatalogId() throws RemoteException;
    public void setCatalogId(int param0) throws RemoteException;
    public java.lang.String getJournal() throws RemoteException;
    public void setJournal(java.lang.String param0) throws RemoteException;
    public java.lang.String getPublisher() throws RemoteException;
    public void setPublisher(java.lang.String param0) throws RemoteException;
    public java.lang.String getEdition() throws RemoteException;
    public void setEdition(java.lang.String param0) throws RemoteException;
    public java.lang.String getAuthor() throws RemoteException;
    public void setAuthor(java.lang.String param0) throws RemoteException;
}

