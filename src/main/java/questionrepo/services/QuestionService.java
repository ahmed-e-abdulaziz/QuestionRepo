package questionrepo.services;

import java.util.List;

import questionrepo.domain.Question;

public interface QuestionService extends CRUDService<Question> {

	List<Question> filter(Integer category, Integer level, Integer type);

}
