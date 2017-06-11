package questionrepo.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="level")
public class Level implements DomainObject {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idlevel")
	private Integer id;
	
	@Column(name="level")
	private String level;


	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	@Override
	public Integer getId() {
		return id;
	}

	@Override
	public void setId(Integer id) {
		this.id=id;
	}

}
