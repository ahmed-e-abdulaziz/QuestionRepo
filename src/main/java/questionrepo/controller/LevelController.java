package questionrepo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import questionrepo.domain.Level;
import questionrepo.services.LevelService;

@RequestMapping("/level")
@RestController
public class LevelController {

	@Autowired
	LevelService levelService;
	
	public LevelService getLevelService() {
		return levelService;
	}

	public void setLevelService(LevelService levelService) {
		this.levelService = levelService;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/all")
	public List<Level> listAll(){
		return (List<Level>) levelService.listAll();
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.POST)
	public Level add(@RequestBody Level level) {
		return levelService.save(level);
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE, consumes = "application/json", produces = "application/json")
	public Level delete(@PathVariable(value = "id") int id) {
		Level Level = levelService.getById(id);
		levelService.delete(id);
		return Level;
	}
}
