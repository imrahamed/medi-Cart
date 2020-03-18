package com.spring.Services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.ConstraintViolationException;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.DomainClasses.*;

@Service
public class BrandService {
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

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Brand> getAllBrands() {
		criteria = sessionFactory.getCurrentSession().createCriteria(Brand.class);
		return (List<Brand>) criteria.list();
	}

	@Transactional
	public Brand getBrandById(Integer id) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Brand.class);
		criteria.add(Restrictions.eq("id", id));
		return (Brand) criteria.uniqueResult();

	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Brand> listBrands() {
		criteria = sessionFactory.getCurrentSession().createCriteria(Brand.class);
		return (List<Brand>) criteria.list();
	}

	@Transactional
	public Boolean editBrand(Brand brandIns) {
		sessionFactory.getCurrentSession().update(brandIns.getCompany());
		sessionFactory.getCurrentSession().update(brandIns);
		return true;
	}

	@Transactional
	public Boolean deleteBrand(Brand brandIns) {
		try {
			sessionFactory.getCurrentSession().delete(brandIns);
			return true;
		} catch (ConstraintViolationException e) {
			return false;
		} catch (DataIntegrityViolationException ex) {
			return false;
		}
	}

	@Transactional
	public Boolean saveBrand(Brand brandIns) {
		sessionFactory.getCurrentSession().save(brandIns);
		return true;
	}
	
	@Transactional 
	public List<Brand> getBrandListByName(String searchValue) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Brand.class);
		criteria.add(Restrictions.like("brandName", searchValue+"%"));
		return (List<Brand>) criteria.list();
	}
	
	@Transactional 
	public List<Medicine> getMedicineListByBrand(Brand brandIns) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.like("brand", brandIns));
		return (List<Medicine>) criteria.list();

	}
	
	@Transactional
	public Map<Brand,Integer> getAllBrandsWithCount() {
		criteria = sessionFactory.getCurrentSession().createCriteria(Brand.class);
		List<Brand> brandList =  (List<Brand>) criteria.list();
		Map<Brand,Integer> brandCountMap = new HashMap<Brand,Integer>();
		for(Brand brandIns: brandList) {
			criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
			criteria.add(Restrictions.like("brand", brandIns));
			@SuppressWarnings("unchecked")
			List<Medicine> medicineList = (List<Medicine>) criteria.list();
			brandCountMap.put(brandIns, medicineList.size());
 		}
		return brandCountMap;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Brand> getBrandListByCompany(Company companyIns) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Brand.class);
		criteria.add(Restrictions.eq("company", companyIns));
		return (List<Brand>) criteria.list();
	}
}
