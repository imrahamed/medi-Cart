package com.spring.Services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.DomainClasses.OrderLine;
import com.spring.DomainClasses.Orders;
import com.spring.DomainClasses.User;

@Service
public class OrderService {
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
	public void saveOrder(Orders orderIns) {
		sessionFactory.getCurrentSession().saveOrUpdate(orderIns.getUser());
		sessionFactory.getCurrentSession().saveOrUpdate(orderIns);
	}
	
	@Transactional
	public List<Orders> listOrders(User userIns) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Orders.class);
		criteria.add(Restrictions.eq("user", userIns));
		return (List<Orders>) criteria.list();
	}
}
