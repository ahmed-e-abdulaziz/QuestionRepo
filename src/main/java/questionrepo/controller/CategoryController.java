package questionrepo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import questionrepo.domain.Category;
import questionrepo.services.CategoryService;

@RequestMapping("/category")
@RestController
public class CategoryController {

	@Autowired
	CategoryService categoryService;

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/all")
	public List<Category> listAll(){
		return (List<Category>) categoryService.listAll();
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.POST)
	public Category add(@RequestBody Category category) {
		return categoryService.save(category);
	}
	
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE, consumes = "application/json", produces = "application/json")
	public Category delete(@PathVariable(value = "id") int id) {
		Category category = categoryService.getById(id);
		categoryService.delete(id);
		return category;
	}
	
}
