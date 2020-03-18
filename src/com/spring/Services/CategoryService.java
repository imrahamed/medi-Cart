package com.spring.Services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.DomainClasses.Brand;
import com.spring.DomainClasses.Category;
import com.spring.DomainClasses.Role;
import com.spring.DomainClasses.User;

@Service
public class CategoryService {
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
	public Boolean createCategory(Category categoryIns) {
		sessionFactory.getCurrentSession().saveOrUpdate(categoryIns);
		return true;
	}
	@Transactional
	public List<Category> getAllCategories() {
		criteria = sessionFactory.getCurrentSession().createCriteria(Category.class);
	    return (List<Category>) criteria.list();
	}
	@Transactional
	public Category getCategoryById(Integer id) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Category.class);
		criteria.add(Restrictions.eq("id", id));
		return (Category) criteria.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Category> listCategories() {
		criteria = sessionFactory.getCurrentSession().createCriteria(Category.class);
	    return (List<Category>) criteria.list();
	}
	
	@Transactional 
	public Boolean editCategory(Category categoryIns) {
		sessionFactory.getCurrentSession().update(categoryIns);
		return true;
	}
	
	@Transactional
	public Boolean deleteCategory(Category categoryIns) {
		sessionFactory.getCurrentSession().delete(categoryIns);
		return true;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional 
	public List<Category> getCategoryListByName(String searchValue) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Category.class);
		criteria.add(Restrictions.like("categoryName", searchValue+"%"));
		return (List<Category>) criteria.list();
	}
	

}
