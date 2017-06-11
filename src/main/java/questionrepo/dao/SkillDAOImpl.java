package questionrepo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import questionrepo.domain.Skill;

public class SkillDAOImpl implements SkillDAO{

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
	public List<Skill> listAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Skill.class).list();
	}

	@Override
	public Skill getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		return (Skill) session.get(Skill.class, id);
	}

	@Override
	public Skill save(Skill domainObject) {
		Session session = sessionFactory.getCurrentSession();
		Integer newId = (Integer) session.save(domainObject);
		return (Skill) session.get(Skill.class, newId);
	}

	@Override
	public Skill update(Skill domainObject) {
		Session session = sessionFactory.getCurrentSession();
		session.update(domainObject);
		return (Skill) session.get(Skill.class, domainObject.getId());
	}

	@Override
	public void delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(session.get(Skill.class, id));
	}

}
