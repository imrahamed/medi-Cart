package com.spring.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.DomainClasses.Brand;
import com.spring.DomainClasses.Category;
import com.spring.DomainClasses.Medicine;
import com.spring.DomainClasses.OrderLine;
import com.spring.DomainClasses.Role;
import com.spring.DomainClasses.User;
import com.spring.Services.BrandService;
import com.spring.Services.CategoryService;
import com.spring.Services.MedicineService;
import com.spring.Services.OrderLineService;

@Controller
public class MedicineController {
    @Autowired
	private MedicineService medicineService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private OrderLineService orderLineService;

	@SuppressWarnings("deprecation")
	@RequestMapping("/medicineCreate")
	public ModelAndView create(Model model) {
		List<Brand> brandList = brandService.getAllBrands();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandList);
		model.addAttribute("categoryList", categoryList);
		for (Category c : categoryList) {
		}
		return new ModelAndView("medicineCreate", "brand", model);
	}

	@RequestMapping("createMedicine")
	public String createMedicine(@RequestParam("medicineName") String medicineName,
			@RequestParam("description") String description, @RequestParam("actualPrice") Double actualPrice,
			@RequestParam("discountPrice") Double discountPrice, @RequestParam("quantity") Integer quantity,
			@RequestParam("brandId") Integer brandId, @RequestParam("categoryId") Integer categoryId,
			@RequestParam("imageURL") String imageURL) {
		Brand brandIns = brandService.getBrandById(brandId);
		Category categoryIns = categoryService.getCategoryById(categoryId);
		Medicine medicineIns = new Medicine(medicineName, description, actualPrice, discountPrice, quantity, brandIns,
				categoryIns, imageURL);
		if (medicineService.createMedicine(medicineIns)) {
			return "redirect:medicineList.do";
		}
		return "";
	}

	@RequestMapping("medicineList")
	public ModelAndView listMedicines(Model model) {
		List<Medicine> medicineList = new ArrayList<Medicine>();
		medicineList = medicineService.listMedicines();
		model.addAttribute("medicineList", medicineList);
		return new ModelAndView("/medicineList", "medicineList", medicineList);
	}

	@RequestMapping("/medicineShow")
	public ModelAndView showMedicine(@RequestParam("medicineId") Integer medicineId) {
		Medicine medicineIns = medicineService.getMedicineById(medicineId);
		return new ModelAndView("medicineShow", "medicineIns", medicineIns);
	}

	@RequestMapping("medicineEdit")
	public ModelAndView edit(@RequestParam("medicineId") Integer medicineId, Model model) {
		Medicine medicineIns = medicineService.getMedicineById(medicineId);
		List<Brand> brandList = brandService.getAllBrands();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandList);
		model.addAttribute("categoryList", categoryList);
		return new ModelAndView("medicineCreate", "medicineIns", medicineIns);
	}

	@RequestMapping("medicineUpdate")
	public ModelAndView updateMedicine(@RequestParam("medicineName") String medicineName,
			@RequestParam("description") String description, @RequestParam("actualPrice") Double actualPrice,
			@RequestParam("discountPrice") Double discountPrice, @RequestParam("quantity") Integer quantity,
			@RequestParam("brandId") Integer brandId, @RequestParam("categoryId") Integer categoryId, Model model,
			@RequestParam("medicineId") Integer medicineId) {
		Brand brandIns = brandService.getBrandById(brandId);
		Category categoryIns = categoryService.getCategoryById(categoryId);
		Medicine medicineIns = new Medicine(medicineId, medicineName, description, actualPrice, discountPrice, quantity,
				brandIns, categoryIns);

		Boolean b = medicineService.editMedicine(medicineIns);
		model.addAttribute("message", "Medicine Details Updated Successfully!");
		if (b) {
			return new ModelAndView("medicineShow", "medicineIns", medicineIns);
		}
		return null;

	}

	@RequestMapping("medicineDelete")
	public String deleteMedicine(@RequestParam("medicineId") Integer medicineId) {
		Medicine medicineIns = medicineService.getMedicineById(medicineId);
		Boolean b = medicineService.deleteMedicine(medicineIns);
		return "redirect:/medicineList.do";

	}

	@RequestMapping("/searchProductByCategory") 
		public ModelAndView searchProductByCategory(@RequestParam("categoryId")Integer categoryId,Model model) {
			Category categoryIns = categoryService.getCategoryById(categoryId);
			Map<Brand,Integer> brandCountMap = brandService.getAllBrandsWithCount();
			List<Category> categoryList = categoryService.getAllCategories();
			model.addAttribute("brandList", brandCountMap);
			model.addAttribute("categoryList", categoryList);
			List<Medicine> medicineList = medicineService.listMedicinesWithCategory(categoryIns);
			return new ModelAndView("home", "medicineList", medicineList);
		}
	
	@RequestMapping("/searchProductByDiscount") 
	public ModelAndView searchProductByDiscount(@RequestParam("discount") Double discount,Model model) {
		Map<Brand,Integer> brandCountMap = brandService.getAllBrandsWithCount();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandCountMap);
		model.addAttribute("categoryList", categoryList);
		List<Medicine> medicineList = medicineService.searchProductByDiscount(discount);
		return new ModelAndView("home","medicineList",medicineList);
	}
	@RequestMapping("/searchProductByRange") 
	public ModelAndView searchProductByRange(@RequestParam("discount") Double discount,Model model) {
		Map<Brand,Integer> brandCountMap = brandService.getAllBrandsWithCount();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandCountMap);
		model.addAttribute("categoryList", categoryList);
		List<Medicine> medicineList = medicineService.searchProductByRange(discount);
		return new ModelAndView("home","medicineList",medicineList);
	}
	
	@RequestMapping("/updateProductQuantity") 
	public String updateProductQuantity() {
		return "index";
	}
	
	@RequestMapping("/blockProduct")
	public String blockProduct(@RequestParam("medicineId") Integer medicineId) {
		Medicine medicineIns = medicineService.getMedicineById(medicineId);
		medicineService.blockProduct(medicineIns);
		return "redirect:/medicineList.do";
		
	}
	
	@RequestMapping("/getBlockedProducts")
	public ModelAndView getBlockedProducts() {
		List<Medicine> medicineList = medicineService.getBlockedProducts();
		return new ModelAndView("medicineList","medicineList",medicineList);
	}
	
	@RequestMapping("/unBlockProduct")
	public String unBlockProduct(@RequestParam("medicineId") Integer medicineId) {
		Medicine medicineIns = medicineService.getMedicineById(medicineId);
		medicineService.unBlockProduct(medicineIns);
		return "redirect:/getBlockedProducts.do";
		
	}
	
}
