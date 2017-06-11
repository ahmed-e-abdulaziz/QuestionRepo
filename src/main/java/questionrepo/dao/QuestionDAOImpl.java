package questionrepo.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import questionrepo.domain.Question;

public class QuestionDAOImpl implements QuestionDAO {

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
	public List<Question> listAll() {
		Session session = sessionFactory.getCurrentSession();
		String queryString = "from Question order by body asc";
		return session.createQuery(queryString).list();
	}

	@Override
	public Question getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		return (Question) session.get(Question.class, id);
	}

	@Override
	public Question save(Question domainObject) {
		Session session = sessionFactory.getCurrentSession();
		Integer newId = (Integer) session.save(domainObject);
		return (Question) session.get(Question.class, newId);
	}

	@Override
	public Question update(Question domainObject) {
		Session session = sessionFactory.getCurrentSession();
		session.update(domainObject);
		return (Question) session.get(Question.class, domainObject.getId());
	}

	@Override
	public void delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(session.get(Question.class, id));
	}
	
	@Override
	public List<Question> filter(Integer category, Integer type, Integer level){
		Session session = sessionFactory.getCurrentSession();

		boolean isFirst=true;
		StringBuilder query = new StringBuilder("from Question q where ");
		if(category!=null){
			if(isFirst){
			query.append("q.category.id=:idc ");
			}
			else{
				query.append("and q.category.id=:idc ");
			}
			isFirst=false;
		}
		if(level!=null){
			if(isFirst){
			query.append("q.level.id=:idl ");
			}
			else{
				query.append("and q.level.id=:idl ");
			}
			isFirst=false;
		}
		if(type!=null){
			if(isFirst){
			query.append("q.type.id=:idt  ");
			}
			else{
				query.append("and q.type.id=:idt ");
			}
			isFirst=false;
		}
		
		query.append(" order by q.id");
		
		Query q = session.createQuery(query.toString());
		if(category!=null){
		q.setParameter("idc", category);
		}
		if(level!=null){
		q.setParameter("idl", level);
		}
		if(type!=null){
		q.setParameter("idt", type);
		}
		@SuppressWarnings("unchecked")
		List<Question> questions = q.list();
		return questions;
	}

}
