package com.spring.Services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.DomainClasses.Brand;
import com.spring.DomainClasses.Company;
import com.spring.DomainClasses.User;

@Service
public class CompanyService {
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
	public Boolean saveCompany(Company companyIns) {
		sessionFactory.getCurrentSession().saveOrUpdate(companyIns.getUser());
		sessionFactory.getCurrentSession().saveOrUpdate(companyIns);
		return true;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Company> listCompanies() {
		criteria = sessionFactory.getCurrentSession().createCriteria(Company.class);
	    return (List<Company>) criteria.list();
	}
	
	@Transactional
	public Company getCompanyByUser(User userIns) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Company.class);
		criteria.add(Restrictions.eq("user", userIns));
		return (Company)criteria.uniqueResult();
	}
	

}
