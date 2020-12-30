import hibernate.Catalog;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.Query;
import java.util.List;

public class HibernateDB {
  Transaction tx;
  Session sess;
  Configuration config;
  SessionFactory sessionFactory;
  public void addToCatalog() {
    try {
      Catalog catalog = new Catalog();
      catalog.setId("catalog 1");
      catalog.setJournal("Oracle Magazine");
      catalog.setPublisher("Oracle Publishing");
      catalog.setEdition("Jan-Feb 2004");
      catalog.setTitle("Understanding Optimization");
      catalog.setAuthor("Kimberly Floss");

      Catalog catalog2 = new Catalog();
      catalog2.setId("catalog 2");
      catalog2.setJournal("Oracle Magazine");
      catalog2.setPublisher("Oracle Publishing");
      catalog2.setEdition("March-April 2005");
      catalog2.setTitle("Starting with Oracle ADF");
      catalog2.setAuthor("Steve Muench");

      config = new Configuration();
      config.addClass(Catalog.class);
      sessionFactory = config.buildSessionFactory();
      sess = sessionFactory.openSession();
      tx = sess.beginTransaction();
      sess.save(catalog);
      sess.save(catalog2);
      tx.commit();
    } catch (Exception e) {
      try {
        if (tx != null) {
          tx.rollback();
        }
      } catch (
        org.hibernate.HibernateException excp) {
      }
    } finally {
      try {
        if (sess != null) {
          sess.close();
        }
      } catch (
        org.hibernate.HibernateException excp) {
      }
    }
  }
  public void retrieveFromCatalog() {
    try {
      String hqlQuery = "from Catalog";
      config = new Configuration();
      config.addClass(Catalog.class);
      sessionFactory = config.buildSessionFactory();
      sess = sessionFactory.openSession();
      Query query = sess.createQuery(hqlQuery);
      List list = query.list();
      for (int i = 0; i < list.size(); i++) {
        Catalog catalog = (Catalog) list.get(i);
        System.out.println(
          "CatalogId " + catalog.getId() +
          " Journal: " + catalog.getJournal());
        System.out.println(
          "CatalogId " + catalog.getId() +
          " Publisher: " + catalog.getPublisher());
        System.out.println(
          "CatalogId " + catalog.getId() +
          " Edition: " + catalog.getEdition());
        System.out.println(
          "CatalogId " + catalog.getId() + " Title " +
          catalog.getTitle());
        System.out.println(
          "CatalogId " + catalog.getId() +
          " Author: " + catalog.getAuthor());
      }
      if (sess != null) {
        sess.close();
      }
    } catch (org.hibernate.HibernateException e) {
    }
  }
  public void updateCatalog() {
    try {
      String hqlQuery = "from Catalog";
      config = new Configuration();
      config.addClass(Catalog.class);
      sessionFactory = config.buildSessionFactory();
      sess = sessionFactory.openSession();
      Query query = sess.createQuery(hqlQuery);
      List list = query.list();
      Catalog catalog = (Catalog) list.get(0);
      catalog.setPublisher("Oracle Magazine");
      tx = sess.beginTransaction();
      sess.saveOrUpdate(catalog);
      tx.commit();
    } catch (Exception e) {
      try {
        if (tx != null) {
          tx.rollback();
        }
      } catch (
        org.hibernate.HibernateException excp) {
      }
    } finally {
      try {
        if (sess != null) {
          sess.close();
        }
      } catch (
        org.hibernate.HibernateException excp) {
      }
    }
  }
      public void deleteFromCatalog() {
          try {
            String hqlQuery = "from Catalog as catalog WHERE catalog.edition='March-April 2005'";
            config = new Configuration();
            config.addClass(Catalog.class);
            sessionFactory = config.buildSessionFactory();
            sess = sessionFactory.openSession();
            Query query = sess.createQuery(hqlQuery);
            List list = query.list();
            Catalog catalog = (Catalog) list.get(0);
            tx = sess.beginTransaction();
            sess.delete(catalog);
            tx.commit();
          } catch (Exception e) {
            try {
              if (tx != null) {
                tx.rollback();
              }
            } catch (
              org.hibernate.HibernateException excp) {
            }
          } finally {
            try {
              if (sess != null) {
                sess.close();
              }
            } catch (
              org.hibernate.HibernateException excp) {
            }
          }
        }
        
  public static void main(String[] argv) {
    HibernateDB hibernateDB = new HibernateDB();
    hibernateDB.addToCatalog();
    /*hibernateDB.retrieveFromCatalog();
    hibernateDB.updateCatalog();
    hibernateDB.deleteFromCatalog();*/
  }
}
