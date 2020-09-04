package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Product;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public int saveProduct(Product product) {

		Session session = this.factory.openSession();

		Transaction tx = session.beginTransaction();
		int proId = (Integer) session.save(product);
		tx.commit();
		return proId;
	}
	
	//get all products
	
	public List<Product> getAllProducts(){
		
		Session s= this.factory.openSession();
		Query query=s.createQuery("from Product");
		List<Product> list=query.list();
		return list;
	}
}
