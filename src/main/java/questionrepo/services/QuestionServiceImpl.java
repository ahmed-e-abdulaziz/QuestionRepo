package questionrepo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import questionrepo.dao.QuestionDAO;
import questionrepo.domain.Question;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionDAO questionDAO;
	
	public QuestionDAO getQuestionDAO() {
		return questionDAO;
	}

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Question> listAll() {
		return (List<Question>) questionDAO.listAll();
	}

	@Override
	public Question getById(Integer id) {
		return questionDAO.getById(id);
	}

	@Override
	public Question save(Question domainObject) {
		return questionDAO.save(domainObject);
	}

	@Override
	public Question update(Question domainObject) {
		return questionDAO.update(domainObject);
	}

	@Override
	public void delete(Integer id) {
		questionDAO.delete(id);
	}
	@Override
	public List<Question> filter(Integer category, Integer level, Integer type){
		return questionDAO.filter(category, type, level);
	}
 
}
