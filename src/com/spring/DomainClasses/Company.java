package com.spring.DomainClasses;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ForeignKey;
import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table(name = "company")
public class Company {
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	@Column(name="companyName")
	private String companyName;
	@ManyToOne
	@ForeignKey(name = "user")
	@Autowired
	private User user;
	public Company(Integer id, String companyName, User user) {
		super();
		this.id = id;
		this.companyName = companyName;
		this.user = user;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getCompanyName() {
		return companyName;
	}
	public Company(Integer id, String companyName) {
		super();
		this.id = id;
		this.companyName = companyName;
	}
	public Company() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
