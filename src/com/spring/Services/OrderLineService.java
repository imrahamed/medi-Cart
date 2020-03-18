package com.spring.Services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.DomainClasses.Medicine;
import com.spring.DomainClasses.OrderLine;
import com.spring.DomainClasses.Orders;
import com.spring.DomainClasses.User;

@Service
public class OrderLineService {
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
	public void saveOrderLine(OrderLine orderLineIns) {
		//sessionFactory.getCurrentSession().saveOrUpdate(orderLineIns.getOrders());
		sessionFactory.getCurrentSession().saveOrUpdate(orderLineIns);
	}
	
	@Transactional
	public OrderLine getOrderLineByOrders(Orders orderIns) {
		criteria = sessionFactory.getCurrentSession().createCriteria(OrderLine.class);
		criteria.add(Restrictions.eq("orders", orderIns));
		return (OrderLine) criteria.uniqueResult();
	}
	
	@Transactional
	public void cancelOrderLine(OrderLine orderLineIns) {
		sessionFactory.getCurrentSession().delete(orderLineIns.getOrders());
		sessionFactory.getCurrentSession().delete(orderLineIns);
	}

	@Transactional
	public OrderLine getOrderLineById(Integer orderLineId) {
		criteria = sessionFactory.getCurrentSession().createCriteria(OrderLine.class);
		criteria.add(Restrictions.eq("id", orderLineId));
		return (OrderLine) criteria.uniqueResult();
	}
	@Transactional
	public void update(OrderLine orderLineIns) {
		//sessionFactory.getCurrentSession().saveOrUpdate(orderLineIns.getOrders());
		sessionFactory.getCurrentSession().update(orderLineIns);
	}
	
	@Transactional
	public List<OrderLine> getOrderLineByMedicine(Medicine medicineIns) {
		criteria = sessionFactory.getCurrentSession().createCriteria(OrderLine.class);
		criteria.add(Restrictions.eq("medicine", medicineIns));
		return (List<OrderLine>) criteria.list();
	}
}
