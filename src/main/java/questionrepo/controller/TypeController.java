package questionrepo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import questionrepo.domain.Type;
import questionrepo.services.TypeService;

@RequestMapping("/type")
@RestController
public class TypeController {

	@Autowired
	TypeService typeService;
	
	public TypeService getTypeService() {
		return typeService;
	}

	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/all")
	public List<Type> listAll(){
		return (List<Type>) typeService.listAll();
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.POST)
	public Type add(@RequestBody Type type) {
		return typeService.save(type);
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE, consumes = "application/json", produces = "application/json")
	public Type delete(@PathVariable(value = "id") int id) {
		Type type = typeService.getById(id);
		typeService.delete(id);
		return type;
	}
	
}
