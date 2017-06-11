package questionrepo.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="question")
public class Question implements DomainObject {

	@Id
	@Column(name="idquestion")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@Column(name="body")
	private String body;
	
	@ManyToOne
	@JoinColumn(name="idcategory")
	private Category category;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="question_skill",
		joinColumns=@JoinColumn(name="idquestion"),
		inverseJoinColumns=@JoinColumn(name="idskill"))
	private List<Skill> skills;
	
	@ManyToOne
	@JoinColumn(name="idtype")
	private Type type;
	
	@ManyToOne
	@JoinColumn(name="idlevel")
	private Level level;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Skill> getSkills() {
		return skills;
	}

	public void setSkills(List<Skill> skills) {
		this.skills = skills;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Level getLevel() {
		return level;
	}

	public void setLevel(Level level) {
		this.level = level;
	}
	
}
