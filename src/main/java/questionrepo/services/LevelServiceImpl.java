package questionrepo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import questionrepo.dao.LevelDAO;
import questionrepo.domain.Level;

@Service
@Transactional
public class LevelServiceImpl implements LevelService {

	@Autowired
	LevelDAO levelDAO;
	
	public LevelDAO getLevelDAO() {
		return levelDAO;
	}

	public void setLevelDAO(LevelDAO levelDAO) {
		this.levelDAO = levelDAO;
	}

	@Override
	public List<?> listAll() {
		return levelDAO.listAll();
	}

	@Override
	public Level getById(Integer id) {
		return levelDAO.getById(id);
	}

	@Override
	public Level save(Level domainObject) {
		return levelDAO.save(domainObject);
	}

	@Override
	public Level update(Level domainObject) {
		return levelDAO.update(domainObject);
	}

	@Override
	public void delete(Integer id) {
		levelDAO.delete(id);
	}

	
}
