package com.spring.Services;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.DomainClasses.Role;
import com.spring.DomainClasses.User;

@Service

public class UserService {

    Criteria criteria = null;
	@Autowired
	public SessionFactory sessionFactory;

	@Autowired
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public Boolean saveUser(User userIns) {
		sessionFactory.getCurrentSession().save(userIns);
		return true;
	}

	@Transactional
	public User checkUserExist(User userIns) {
		criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("userName", userIns.getUserName()));
		criteria.add(Restrictions.eq("password", userIns.getPassword()));
		return (User) criteria.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<User> listUsers() {
		criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
	    return (List<User>) criteria.list();
	}
	
	@Transactional
	public User getUserById(Integer id) {
		criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("id", id));
		return (User) criteria.uniqueResult();
	}
	
	@Transactional 
	public Boolean editUser(User userIns) {
		sessionFactory.getCurrentSession().update(userIns);
		return true;
	}
	
	@Transactional
	public Boolean deleteUser(User userIns) {
		System.out.println("userIns id"+userIns.getId());
		sessionFactory.getCurrentSession().delete(userIns);
		return true;
	}
	
	@Transactional
	public void assignRoleToUser(User userIns,Role roleIns) {
		userIns.setRole(roleIns);
		sessionFactory.getCurrentSession().saveOrUpdate(userIns);
	}
}
