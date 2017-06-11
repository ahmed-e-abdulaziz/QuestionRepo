package questionrepo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import questionrepo.domain.Level;

@Repository
public class LevelDAOImpl implements LevelDAO {

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
	public List<Level> listAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Level> levels = session.createCriteria(Level.class).list();
		return levels;
	}

	@Override
	public Level getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Level level = (Level) session.get(Level.class, id);
		return level;
	}

	@Override
	public Level save(Level domainObject) {
		Session session = sessionFactory.getCurrentSession();
		Integer newId = (Integer) session.save(domainObject);
		Level level = (Level) session.get(Level.class, newId);
		return level;
	}

	@Override
	public Level update(Level domainObject) {
		Session session = sessionFactory.getCurrentSession();
		session.update(domainObject);
		Level updatedLevel = (Level) session.get(Level.class, domainObject.getId());
		return updatedLevel;
	}

	@Override
	public void delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(session.get(Level.class, id));
	}

}
