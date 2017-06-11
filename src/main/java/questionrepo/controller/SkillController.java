package questionrepo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import questionrepo.domain.Skill;
import questionrepo.services.SkillService;

@RequestMapping("/skill")
@RestController
public class SkillController {

	@Autowired
	SkillService skillService;

	public SkillService getSkillService() {
		return skillService;
	}

	public void setSkillService(SkillService skillService) {
		this.skillService = skillService;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/all")
	public List<Skill> listAll(){
		return (List<Skill>) skillService.listAll();
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.POST)
	public Skill add(@RequestBody Skill skill) {
		return skillService.save(skill);
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE, consumes = "application/json", produces = "application/json")
	public Skill delete(@PathVariable(value = "id") int id) {
		Skill skill = skillService.getById(id);
		skillService.delete(id);
		return skill;
	}
}
