package com.spring.Services;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.DomainClasses.Brand;
import com.spring.DomainClasses.Category;
import com.spring.DomainClasses.Medicine;
import com.spring.DomainClasses.Role;
import com.spring.DomainClasses.User;

@Service
public class MedicineService {
    Criteria criteria = null;
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private BrandService brandService;
	@Autowired
	private CategoryService categoryService;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public Boolean createMedicine(Medicine medicineIns) {
		sessionFactory.getCurrentSession().saveOrUpdate(medicineIns.getBrand());
		sessionFactory.getCurrentSession().saveOrUpdate(medicineIns.getCategory());
		sessionFactory.getCurrentSession().saveOrUpdate(medicineIns);
		return true;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Medicine> listMedicines() {
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.eq("isBlocked", false));
	    return (List<Medicine>) criteria.list();
	}
	
	@Transactional
	public Medicine getMedicineById(Integer id) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.eq("id", id));
		return (Medicine) criteria.uniqueResult();
	}
	
	@Transactional 
	public Boolean editMedicine(Medicine medicineIns) {
		sessionFactory.getCurrentSession().update(medicineIns);
		return true;
	}
	
	@Transactional
	public Boolean deleteMedicine(Medicine medicineIns) {
		sessionFactory.getCurrentSession().delete(medicineIns);
		return true;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Medicine> searchProduct(String searchBy,String searchValue) {
		List<Medicine> medicineList = new ArrayList<Medicine>();
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.eq("isBlocked", false));
		List<Brand> brandList = new ArrayList<Brand>();
		List<Category> categoryList = new ArrayList<Category>();
		if(searchBy.equals("brand")) {
			brandList = brandService.getBrandListByName(searchValue);
			for(Brand b:brandList) {
				criteria.add(Restrictions.like("brand", b));
				medicineList.addAll((List<Medicine>)criteria.list());
			}
		} else if(searchBy.equals("category")) {
			 categoryList = categoryService.getCategoryListByName(searchValue);
			 for(Category c:categoryList) {
				 criteria.add(Restrictions.like("category", c));
				 medicineList.addAll((List<Medicine>)criteria.list());
			 }
		} else {
			criteria.add(Restrictions.like(searchBy,searchValue+"%"));
			medicineList = (List<Medicine>) criteria.list();
		}
		
		
		return  medicineList;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional 
	public List<Medicine> listMedicinesWithDiscountPrice() {
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.eq("isBlocked", false));
		criteria.add(Restrictions.gt("discountPrice",0.0));
		return (List<Medicine>) criteria.list();
	}
	
	@Transactional
	public Medicine getMedicineByName(String medicineName) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.eq("isBlocked", false));
		criteria.add(Restrictions.eq("medicineName", medicineName));
		return (Medicine) criteria.uniqueResult();
	}
	
	@Transactional
	public List<Medicine> listMedicinesWithCategory(Category categoryIns) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.eq("isBlocked", false));
		criteria.add(Restrictions.eq("category", categoryIns));
		return (List<Medicine>) criteria.list();
	}
	
	@Transactional
	public List<Medicine> searchProductByDiscount(Double discount) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.eq("isBlocked", false));
		criteria.add(Restrictions.lt("discountPrice", discount));
		return (List<Medicine>) criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Medicine> searchProductByRange(Double discount) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.eq("isBlocked", false));
		criteria.add(Restrictions.between("actualPrice",100.0, discount));
		return (List<Medicine>) criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Medicine> getMedicineByBrand(Brand brandIns) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.eq("isBlocked", false));
		criteria.add(Restrictions.eq("brand", brandIns));
		return (List<Medicine>) criteria.list();
	}
	
	@Transactional
	public void blockProduct(Medicine medicineIns) {
		medicineIns.setIsBlocked(true);
		sessionFactory.getCurrentSession().update(medicineIns);
	}
	
	@Transactional
	public void unBlockProduct(Medicine medicineIns) {
		medicineIns.setIsBlocked(false);
		sessionFactory.getCurrentSession().update(medicineIns);
	}
	
	@Transactional
	public List<Medicine> getBlockedProducts() {
		criteria = sessionFactory.getCurrentSession().createCriteria(Medicine.class);
		criteria.add(Restrictions.eq("isBlocked", true));
		return (List<Medicine>) criteria.list();
	}
	
	
}
