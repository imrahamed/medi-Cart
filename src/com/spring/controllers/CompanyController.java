package com.spring.controllers;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.DomainClasses.Brand;
import com.spring.DomainClasses.Company;
import com.spring.DomainClasses.User;
import com.spring.Services.BrandService;
import com.spring.Services.CompanyService;
import com.spring.Services.UserService;

@SessionAttributes({ "user" })
@Controller
public class CompanyController {
    HttpSession session;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private BrandService brandService;
	private Company companyIns = new Company();
	private Brand brandIns = new Brand();
	@RequestMapping("companyCreate")
	public String create() {
		return "companyCreate";
	}
	@RequestMapping("createCompany")
	public String companyCreate(@RequestParam("companyName") String companyName,@RequestParam("brandName")String brandName, @ModelAttribute User user,
			HttpServletRequest request) {
		String[] a = brandName.split(",");
		companyIns.setCompanyName(companyName);
		session = request.getSession(true);
		User userIns = (User) session.getAttribute("user");
		companyIns.setUser(user);
		companyService.saveCompany(companyIns);
		for(int i=0;i<a.length;i++) {
		brandIns.setBrandName(a[i]);
		System.out.println(a[i]);
		brandIns.setCompany(companyIns);
		brandService.saveBrand(brandIns);
		}
		return "redirect:brandList.do";
		
		
	}
	
	@RequestMapping("companyList")
	public ModelAndView listCompanies(Model model) {
		System.out.println("company-list");
		List<Company> companyList = new ArrayList<Company>();
		companyList = companyService.listCompanies();
		model.addAttribute("companyList", companyList);
		return new ModelAndView("companyList", "companyList", companyList);
	}
	
	

}
