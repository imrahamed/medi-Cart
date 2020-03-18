package com.spring.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.DomainClasses.Category;
import com.spring.DomainClasses.Role;
import com.spring.DomainClasses.User;
import com.spring.Services.CategoryService;

@Controller
public class CategoryController {
    @Autowired
	private CategoryService categoryService;
	private Category categoryIns = new Category();

	@RequestMapping("categoryCreate")
	public String create() {
		return "categoryCreate";
	}

	@RequestMapping("createCategory")
	public String createCategory(@RequestParam("categoryName") String categoryName,
			@RequestParam("description") String description) {
		categoryIns = new Category(categoryName, description);
			Boolean b = categoryService.createCategory(categoryIns);
			return "redirect:/categoryList.do";
	}

	@RequestMapping("/categoryList")
	public ModelAndView listCategories(Model model) {
		List<Category> categoryList = new ArrayList<Category>();
		categoryList = categoryService.listCategories();
		model.addAttribute("categoryList", categoryList);
		return new ModelAndView("/categoryList", "categoryList", categoryList);
	}
	
	@RequestMapping("/categoryShow")
	public ModelAndView showCategory(@RequestParam("categoryId") String categoryId) {
		Category categoryIns = categoryService.getCategoryById(Integer.parseInt(categoryId));
		return new ModelAndView("/categoryShow", "categoryIns", categoryIns);
	}
	
	@RequestMapping("/categoryEdit")
	public ModelAndView edit(@RequestParam("categoryId") Integer categoryId) {
		Category categoryIns = categoryService.getCategoryById(categoryId);
		return new ModelAndView("/categoryCreate", "categoryIns", categoryIns);
	}
	
	@RequestMapping("/categoryUpdate")
	public ModelAndView updateUser(@ModelAttribute("Category")Category categoryIns,Model model) {
		Boolean b = categoryService.editCategory(categoryIns);
		model.addAttribute("message", "Category Updated Successfully!");
		if(b) {
			return new ModelAndView("/categoryShow", "categoryIns", categoryIns);
		} 
		return null;
		
	}
	
	@RequestMapping("/categoryDelete")
	public String deleteUser(@RequestParam("categoryId") Integer categoryId) {
		Category categoryIns = categoryService.getCategoryById(categoryId);
		Boolean b = categoryService.deleteCategory(categoryIns);
		return "redirect:/categoryList.do";

	}

}
