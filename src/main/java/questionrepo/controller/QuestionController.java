package questionrepo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import questionrepo.domain.Question;
import questionrepo.services.QuestionService;

@RequestMapping("/question")
@RestController
public class QuestionController {

	@Autowired
	QuestionService questionService;

	

	public QuestionService getQuestionService() {
		return questionService;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/all")
	public List<Question> listAll() {
		return (List<Question>) questionService.listAll();
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/form", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public List<Question> addOrUpdate(@RequestBody Question question) {

		if (question.getId() != null) {
			if (question.getId() > 0) {
				questionService.update(question);
			}
		} else {
			questionService.save(question);
		}

		List<Question> questions = (List<Question>) questionService.listAll();
		return questions;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE, consumes = "application/json", produces = "application/json")
	public Question delete(@PathVariable(value = "id") int id) {
		Question question = questionService.getById(id);
		questionService.delete(id);
		return question;
	}
	
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET, consumes = "application/json", produces = "application/json")
	public Question getById(@PathVariable(value = "id") int id) {
		Question question = questionService.getById(id);
		return question;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/get/filter",method=RequestMethod.GET,consumes = "application/json", produces = "application/json")
	public List<Question> filter(
			@RequestParam(name="category", required=false) Integer idcategory
			,@RequestParam(name="level", required=false) Integer idlevel
			,@RequestParam(name="type", required=false) Integer idtype){
		System.out.println(idcategory+" "+idlevel+" "+idtype);
		if(idcategory==null&&idlevel==null&&idtype==null){
			return (List<Question>) questionService.listAll();
		}
		return questionService.filter(idcategory, idlevel, idtype);
	}
}
