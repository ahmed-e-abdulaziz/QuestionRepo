package questionrepo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import questionrepo.domain.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Override
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> listAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Category.class).list();
	}

	@Override
	public Category getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		return (Category) session.get(Category.class, id);
	}

	@Override
	public Category save(Category domainObject) {
		Session session = sessionFactory.getCurrentSession();
		Integer id = (Integer) session.save(domainObject);
		return (Category) session.get(Category.class, id);
	}

	@Override
	public Category update(Category domainObject) {
		Session session = sessionFactory.getCurrentSession();
		session.update(domainObject);
		return (Category) session.get(Category.class, domainObject.getId());
	}

	@Override
	public void delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(session.get(Category.class, id));
	}

}
