package questionrepo.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="skill")
public class Skill implements DomainObject{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idskill")
	private Integer id;
	
	@Column(name="skill")
	private String skill;
	

	@JsonIgnore
	@ManyToMany(mappedBy="skills",fetch=FetchType.LAZY)
	private List<Question> questions;
	
	@Override
	public Integer getId() {
		return id;
	}

	@Override
	public void setId(Integer id) {
		this.id = id;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}
	
}
