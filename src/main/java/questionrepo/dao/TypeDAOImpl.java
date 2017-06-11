package questionrepo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import questionrepo.domain.Type;

@Repository
public class TypeDAOImpl implements TypeDAO {

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

	@Override
	@SuppressWarnings("unchecked")
	public List<Type> listAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Type> types = session.createCriteria(Type.class).list();
		return types;
	}

	@Override
	public Type getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Type type = (Type) session.get(Type.class, id);
		return type;
	}

	@Override
	public Type save(Type domainObject) {
		Session session = sessionFactory.getCurrentSession();
		Integer newId = (Integer) session.save(domainObject);
		Type insertedType = (Type) session.get(Type.class, newId);
		return insertedType;
	}

	@Override
	public Type update(Type domainObject) {
		Session session = sessionFactory.getCurrentSession();
		session.update(domainObject);
		Type updatedType = (Type) session.get(Type.class,domainObject.getId());
		return updatedType;
	}

	@Override
	public void delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(session.get(Type.class, id)); 
	}

}
