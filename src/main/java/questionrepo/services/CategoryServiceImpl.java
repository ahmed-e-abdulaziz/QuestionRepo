package questionrepo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import questionrepo.dao.CategoryDAO;
import questionrepo.domain.Category;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryDAO categoryDAO;
	
	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	@Override
	public List<?> listAll() {
		return categoryDAO.listAll();
	}

	@Override
	public Category getById(Integer id) {
		return categoryDAO.getById(id);
	}

	@Override
	public Category save(Category domainObject) {
		return categoryDAO.save(domainObject);
	}

	@Override
	public Category update(Category domainObject) {
		return categoryDAO.update(domainObject);
	}

	@Override
	public void delete(Integer id) {
		categoryDAO.delete(id);
	}

}
