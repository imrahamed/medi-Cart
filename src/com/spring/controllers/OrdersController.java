package com.spring.controllers;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.DomainClasses.Brand;
import com.spring.DomainClasses.Company;
import com.spring.DomainClasses.Medicine;
import com.spring.DomainClasses.OrderLine;
import com.spring.DomainClasses.User;
import com.spring.Services.BrandService;
import com.spring.Services.OrderLineService;
import com.spring.Services.OrderService;
import com.spring.Services.CompanyService;
import com.spring.Services.MedicineService;

@SessionAttributes({ "user" })
@Controller
public class OrdersController {
    @Autowired
	private OrderService orderService;
	@Autowired
	private MedicineService medicineService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private OrderLineService orderLineService;
	@Autowired
	private BrandService brandService;
	HttpSession session;
	@RequestMapping("myOrders")
	public ModelAndView myOrders(HttpServletRequest request) {
		session = request.getSession(true);
		User userIns = (User) session.getAttribute("user");
		Company companyIns = companyService.getCompanyByUser(userIns);
		List<Brand> brandList = brandService.getBrandListByCompany(companyIns);
		List<Medicine> medicineList = new ArrayList<Medicine>();
		List<OrderLine> orderLineList = new ArrayList<OrderLine>();
		for(Brand brandIns:brandList) {
			medicineList.addAll(medicineService.getMedicineByBrand(brandIns));
		}
		for(Medicine medicineIns:medicineList) {
			orderLineList.addAll(orderLineService.getOrderLineByMedicine(medicineIns));
		}
		System.out.println("inside controller");
		return new ModelAndView("myOrders","orderLineList",orderLineList);
		
	}
}

