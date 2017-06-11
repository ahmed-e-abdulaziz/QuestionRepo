package questionrepo.dao;

import java.util.List;

import questionrepo.domain.Question;

public interface QuestionDAO extends CRUDDAO<Question> {

	List<Question> filter(Integer category, Integer type, Integer level);

}
