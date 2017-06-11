package questionrepo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import questionrepo.dao.TypeDAO;
import questionrepo.domain.Type;

@Service
@Transactional
public class TypeServiceImpl implements TypeService{

	@Autowired
	TypeDAO typeDAO;
	
	public TypeDAO getTypeDAO() {
		return typeDAO;
	}

	public void setTypeDAO(TypeDAO typeDAO) {
		this.typeDAO = typeDAO;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Type> listAll() {
		return (List<Type>) typeDAO.listAll();
	}

	@Override
	public Type getById(Integer id) {
		return typeDAO.getById(id);
	}

	@Override
	public Type save(Type domainObject) {
		return typeDAO.save(domainObject);
	}

	@Override
	public Type update(Type domainObject) {
		return typeDAO.update(domainObject);
	}

	@Override
	public void delete(Integer id) {
		typeDAO.delete(id);
	}

}
