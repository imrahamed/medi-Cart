package com.spring.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.DomainClasses.Brand;
import com.spring.DomainClasses.Category;
import com.spring.DomainClasses.Company;
import com.spring.DomainClasses.Medicine;
import com.spring.DomainClasses.Role;
import com.spring.DomainClasses.User;
import com.spring.Services.BrandService;
import com.spring.Services.CategoryService;

@Controller
public class BrandController {
    @Autowired
	private BrandService brandService;
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/brandList")
	public ModelAndView listUsers(Model model) {
		List<Brand> brandList = new ArrayList<Brand>();
		brandList = brandService.listBrands();
		model.addAttribute("brandList", brandList);
		return new ModelAndView("/brandList", "brandList", brandList);
	}
	
	@RequestMapping("/brandShow")
	public ModelAndView showBrand(@RequestParam("brandId") String brandId) {
		Brand brandIns = brandService.getBrandById(Integer.parseInt(brandId));
		return new ModelAndView("brandShow", "brandIns", brandIns);
	}
	
	@RequestMapping("/brandEdit")
	public ModelAndView edit(@RequestParam("brandId") Integer brandId) {
		Brand brandIns = brandService.getBrandById(brandId);
		return new ModelAndView("companyCreate", "brandIns", brandIns);
	}
	
	@RequestMapping("/companyUpdate")
	public ModelAndView updateCompany(@RequestParam("companyName")String companyName,@RequestParam("brandName")String brandName,@RequestParam("brandId") Integer brandId,@RequestParam("companyId")Integer companyId,Model model) {
		Company companyIns = new Company();
		companyIns.setCompanyName(companyName);
		companyIns.setId(companyId);
		Brand brandIns = new Brand();
		brandIns.setId(brandId);
		brandIns.setBrandName(brandName);
		brandIns.setCompany(companyIns);
		Boolean b = brandService.editBrand(brandIns);
		model.addAttribute("message", "Brand Updated Successfully!");
		if(b) {
			return new ModelAndView("/brandShow", "brandIns", brandIns);
		} 
		return null;
		
	}
	
	@RequestMapping("/brandDelete")
	public String deleteUser(@RequestParam("brandId") Integer brandId) {
		Brand brandIns = brandService.getBrandById(brandId);
		Boolean b = brandService.deleteBrand(brandIns);
		return "redirect:brandList.do";

	}
	
	@RequestMapping("/searchProductByBrand")
	public ModelAndView searchProductByBrand(Integer brandId,Model model) {
		Brand brandIns = brandService.getBrandById(brandId);
		List<Medicine> medicineList = brandService.getMedicineListByBrand(brandIns);
		Map<Brand,Integer> brandCountMap = brandService.getAllBrandsWithCount();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandCountMap);
		model.addAttribute("categoryList", categoryList);
		return new ModelAndView("home","medicineList",medicineList);
	}

}
