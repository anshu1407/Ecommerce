package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// save category into database
	public int saveCategory(Category cat) {

		Session session = this.factory.openSession();

		Transaction tx = session.beginTransaction();
		int catId = (Integer) session.save(cat);
		tx.commit();
		return catId;
	}

	public List<Category> getCategories() {
		Session session = this.factory.openSession();
		Query q = session.createQuery("from Category");
		List<Category> list = q.list();

		return list;

	}

	public Category getCategoryById(int cId) {

		Category cat = null;
		try {
			Session session = this.factory.openSession();

			cat = session.get(Category.class, cId);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cat;

	}
}
