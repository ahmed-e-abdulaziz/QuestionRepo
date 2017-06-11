package questionrepo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import questionrepo.dao.SkillDAO;
import questionrepo.domain.Skill;

@Service
@Transactional
public class SkillServiceImpl implements SkillService{

	@Autowired
	SkillDAO skillDAO;
	
	public SkillDAO getSkillDAO() {
		return skillDAO;
	}

	public void setSkillDAO(SkillDAO skillDAO) {
		this.skillDAO = skillDAO;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Skill> listAll() {
		return (List<Skill>) skillDAO.listAll();
	}

	@Override
	public Skill getById(Integer id) {
		return skillDAO.getById(id);
	}

	@Override
	public Skill save(Skill domainObject) {
		return skillDAO.save(domainObject);
	}

	@Override
	public Skill update(Skill domainObject) {
		return skillDAO.update(domainObject);
	}

	@Override
	public void delete(Integer id) {
		skillDAO.delete(id);
	}

}
