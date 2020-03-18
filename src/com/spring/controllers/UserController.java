package com.spring.controllers;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.spring.DomainClasses.Brand;
import com.spring.DomainClasses.Category;
import com.spring.DomainClasses.Medicine;
import com.spring.DomainClasses.OrderLine;
import com.spring.DomainClasses.Orders;
import com.spring.DomainClasses.Role;
import com.spring.DomainClasses.User;
import com.spring.Services.*;
import org.apache.log4j.Logger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.lang.reflect.Type;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@SessionAttributes({ "user" })
@Controller
public class UserController {

    HttpSession session;
	@Autowired
	private UserService userService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MedicineService medicineService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderLineService orderLineService;
	private User userIns = new User();

	@RequestMapping("/index")
	public String index() {
		System.out.println("index");
		return "index";
	}

	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}

	@RequestMapping("/loginUser")
	public ModelAndView loginUser(@RequestParam("userName") String userName, @RequestParam("password") String password,
			HttpServletRequest request, Model model) {
		userIns.setUserName(userName);
		userIns.setPassword(password);
		if (userService.checkUserExist(userIns) != null) {
			session = request.getSession(true);
			session.setAttribute("loginStatus", "true");
			userIns = userService.checkUserExist(userIns);
			session.setAttribute("user", userIns);
			Map<Brand, Integer> brandCountMap = brandService.getAllBrandsWithCount();
			List<Category> categoryList = categoryService.getAllCategories();
			model.addAttribute("brandList", brandCountMap);
			model.addAttribute("categoryList", categoryList);
			List<Medicine> medicineList = medicineService.listMedicines();
			return new ModelAndView("home", "medicineList", medicineList);
		} else {
			return new ModelAndView("index", "message", "UserName or Password may be wrong! Please Try Again");
		}

	}

	@RequestMapping("userList")
	public ModelAndView listUsers(Model model, @ModelAttribute String message) {
		List<User> userList = new ArrayList<User>();
		userList = userService.listUsers();
		model.addAttribute("message", message);
		return new ModelAndView("userList", "userList", userList);
	}
	
	@RequestMapping("signinUser")
	public ModelAndView signinUser(@RequestParam("username")String userName,@RequestParam("password")String password,@RequestParam("mobile")String mobile,
			@RequestParam("address")String address,@RequestParam("email")String email,HttpServletRequest request,Model model,
			@RequestParam("createSeller")Integer createSeller) {
		User userIns = new User(userName,email,password,mobile,address);
		Role roleIns=null;
		if(createSeller==null) {
			 roleIns = roleService.getRoleById(2);
		} else {
			 roleIns = roleService.getRoleById(3);
		}
		userIns.setRole(roleIns);
		userService.saveUser(userIns);
		
		List<Medicine> medicineList = medicineService.listMedicinesWithDiscountPrice();
		Map<Brand,Integer> brandCountMap = brandService.getAllBrandsWithCount();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandCountMap);
		model.addAttribute("categoryList", categoryList);
		if(createSeller==null) {
			session = request.getSession();
			session.setAttribute("user", userIns);
			session.setAttribute("loginStatus", "true");
			return new ModelAndView("home", "medicineList", medicineList);
		} else {
			return new ModelAndView("redirect:userList.do", "medicineList", medicineList);
		}
		
	}
	@RequestMapping("home")
	public ModelAndView homePage(Model model) {
		List<Medicine> medicineList = medicineService.listMedicines();
		Map<Brand,Integer> brandCountMap = brandService.getAllBrandsWithCount();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandCountMap);
		model.addAttribute("categoryList", categoryList);
		return new ModelAndView("home", "medicineList", medicineList);
	}
	
	@RequestMapping("createUser")
	public String createUser(@RequestParam("userName")String userName,@RequestParam("password")String password,@RequestParam("mobile")String mobile,
			@RequestParam("address")String address,@RequestParam("email")String email,Integer roleId) {
		User userIns = new User(userName,email,password,mobile,address);
		Role roleIns = roleService.getRoleById(roleId);
		userIns.setRole(roleIns);
		userService.saveUser(userIns);
		return "redirect:userList.do";
	}

	@RequestMapping("getAllProducts")
	public ModelAndView getAllProducts(Model model) {
		List<Medicine> medicineList = medicineService.listMedicines();
		Map<Brand,Integer> brandCountMap = brandService.getAllBrandsWithCount();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandCountMap);
		model.addAttribute("categoryList", categoryList);
		return new ModelAndView("home", "medicineList", medicineList);
	}

	@RequestMapping("getDiscountProducts")
	public ModelAndView getDiscountProducts(Model model) {
		List<Medicine> medicineList = medicineService.listMedicinesWithDiscountPrice();
		Map<Brand,Integer> brandCountMap = brandService.getAllBrandsWithCount();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandCountMap);
		model.addAttribute("categoryList", categoryList);
		return new ModelAndView("home", "medicineList", medicineList);

	}


	
	@RequestMapping("userHomePage")
	public ModelAndView home(Model model) {
		List<Medicine> medicineList = medicineService.listMedicines();
		Map<Brand,Integer> brandCountMap = brandService.getAllBrandsWithCount();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandCountMap);
		model.addAttribute("categoryList", categoryList);
		return new ModelAndView("home", "medicineList", medicineList);
		
	}


	@RequestMapping("userShow")
	public ModelAndView showUser(@RequestParam("userId") String userId) {
		User userIns = userService.getUserById(Integer.parseInt(userId));
		return new ModelAndView("userShow", "userIns", userIns);
	}

	@RequestMapping("userEdit")
	public ModelAndView edit(@RequestParam("userId") Integer userId,Model model) {
		User userIns = userService.getUserById(userId);
		List<Role> roleList = roleService.getRoleList();
		model.addAttribute("roleList", roleList);
		return new ModelAndView("signup", "userIns", userIns);
	}

	@RequestMapping("userUpdate")
	public ModelAndView updateUser(@ModelAttribute("user") User userIns, Model model,@RequestParam("roleId")Integer roleId) {
		Role roleIns = roleService.getRoleById(roleId);
		userIns.setRole(roleIns);
		Boolean b = userService.editUser(userIns);
		model.addAttribute("message", "User Updated Successfully!");
		if (b) {
			return new ModelAndView("userShow", "userIns", userIns);
		}
		return null;

	}

	@RequestMapping("userDelete")
	public ModelAndView deleteUser(@RequestParam("userId") Integer userId, Model model, HttpServletRequest request) {
		User userIns = userService.getUserById(userId);
		Boolean b = userService.deleteUser(userIns);
		String message = "Not set";
		// session = request.getSession();
		if (b) {
			message = "User Deleted Successfully";
			return new ModelAndView("redirect:userList.do", "message", message);
		} else {
			message = "Could not delete user!";
			return new ModelAndView("redirect:userList.do", "message", message);
		}

	}

//	@RequestMapping("/user/order")
//	public ModelAndView orderMedicine(@RequestParam("medicineId") Integer medicineId, @ModelAttribute User user,
//			Model model) {
//		Map<Orders, OrderLine> ordersMap = new HashMap<Orders, OrderLine>();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		Medicine medicineIns = medicineService.getMedicineById(medicineId);
//		re
//	} 
	

	@RequestMapping("/searchProduct")
	public ModelAndView searchProduct(@RequestParam("searchBy") String searchBy,
			@RequestParam("searchValue") String searchValue,Model model) {
		List<Medicine> medicineList = medicineService.searchProduct(searchBy, searchValue);
		Map<Brand,Integer> brandCountMap = brandService.getAllBrandsWithCount();
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("brandList", brandCountMap);
		model.addAttribute("categoryList", categoryList);
		return new ModelAndView("home", "medicineList", medicineList);
	}

	@RequestMapping("cancelOrder")
	public ModelAndView cancelOrder(@RequestParam("orderLineId") Integer orderLineId, @ModelAttribute User user,
			Model model) {
		Map<Orders, OrderLine> ordersMap = new HashMap<Orders, OrderLine>();
		OrderLine orderLineIns = orderLineService.getOrderLineById(orderLineId);
		orderLineService.cancelOrderLine(orderLineIns);
		List<Orders> ordersList = orderService.listOrders(user);
		for (Orders orderIns1 : ordersList) {
			OrderLine orderLineIns1 = orderLineService.getOrderLineByOrders(orderIns1);
			ordersMap.put(orderIns1, orderLineIns1);
		}
		model.addAttribute("ordersMap", ordersMap);
		return new ModelAndView("myCart", "ordersMap", ordersMap);

	}

	@RequestMapping("myCart")
	public ModelAndView myCart(@ModelAttribute User user, Model model) {
		System.out.println("/user/myCart");
		Map<Orders, OrderLine> ordersMap = new HashMap<Orders, OrderLine>();
		List<Orders> ordersList = orderService.listOrders(user);
		for (Orders orderIns1 : ordersList) {
			OrderLine orderLineIns1 = orderLineService.getOrderLineByOrders(orderIns1);
			ordersMap.put(orderIns1, orderLineIns1);
		}
		model.addAttribute("ordersMap", ordersMap);
		return new ModelAndView("myCart", "ordersMap", ordersMap);

	}
	
	@RequestMapping("assignRole")
	public ModelAndView assignRole(@RequestParam("userId")Integer userId) {
		User userIns = userService.getUserById(userId);
		return new ModelAndView("assignRole","userIns",userIns);
	}
	
	@RequestMapping("assignRoleToUser")
	public String assignRoleToUser(@RequestParam("userId")Integer userId,@RequestParam("roleId")Integer roleId) {
		User userIns = userService.getUserById(userId);
		Role roleIns = roleService.getRoleById(roleId);
		userService.assignRoleToUser(userIns,roleIns);
		return "redirect:userList";
	}
	
	@RequestMapping("addToCart")
    public ModelAndView addToCart(@RequestParam("myArray") String myArray,@ModelAttribute User user,Model model) {
		System.out.println("Add to cart call ");
		List<Medicine> medicineList = new ArrayList<Medicine>();
		Gson converter = new Gson();
		 Type type = new TypeToken<List<String>>(){}.getType();
        List<String> list =  converter.fromJson(myArray, type );
        for( String medicineName : list) {
        	System.out.println("GSON converted String "+medicineName);
       	 Medicine medicineIns = medicineService.getMedicineByName(medicineName);
       	 medicineList.add(medicineIns);
        }
         Map<Orders, OrderLine> ordersMap = new HashMap<Orders, OrderLine>();
 		for(Medicine medicineIns:medicineList) {
 			Orders orderIns = new Orders(user, "Your order has been Booked successfully", medicineIns.getActualPrice(), new Date());
 			orderService.saveOrder(orderIns);
 			OrderLine orderLineIns = new OrderLine(medicineIns, 1, medicineIns.getActualPrice(), orderIns);
 			orderLineService.saveOrderLine(orderLineIns);
 		}
 		List<Orders> ordersList = orderService.listOrders(user);
 		for(Orders o: ordersList) 
 			System.out.println("ordersList"+o.getTotalAmount());
			for (Orders orderIns1 : ordersList) {
				OrderLine orderLineIns1 = orderLineService.getOrderLineByOrders(orderIns1);
				ordersMap.put(orderIns1, orderLineIns1);
			}
 		model.addAttribute("ordersMap", ordersMap);
// 		for(Map.Entry<Orders, OrderLine> m:ordersMap.entrySet())
// 			System.out.println("jsbdhjbfsjdbhf"+m.getValue().getMedicine().getMedicineName());
 		return new ModelAndView("myCart", "ordersMap", ordersMap);
    }
	
	@RequestMapping("user/orderProduct") 
	public void orderProduct(@ModelAttribute User user,Model model) {
		System.out.println("controller redirected");
//		Map<Orders, OrderLine> ordersMap = new HashMap<Orders, OrderLine>();
//		for(Medicine medicineIns:medicineList) {
//			Orders orderIns = new Orders(user, "Booked", medicineIns.getActualPrice(), new Date());
//			orderService.saveOrder(orderIns);
//			OrderLine orderLineIns = new OrderLine(medicineIns, 1, medicineIns.getActualPrice(), orderIns);
//			orderLineService.saveOrderLine(orderLineIns);
//			List<Orders> ordersList = orderService.listOrders(user);
//			for (Orders orderIns1 : ordersList) {
//				OrderLine orderLineIns1 = orderLineService.getOrderLineByOrders(orderIns1);
//				ordersMap.put(orderIns1, orderLineIns1);
//			}
//		}
//		model.addAttribute("ordersMap", ordersMap);
	//	return new ModelAndView("/user/myCart", "ordersMap", ordersMap);
	}
	
	@RequestMapping("/createSeller")
	public ModelAndView createSeller(@RequestParam("createSeller")Integer createSeller,Model model) {
		model.addAttribute("createSeller", createSeller);
		return new ModelAndView("signup","createSeller",createSeller);
	}
	
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView invalidate(@ModelAttribute User user) {
		session.removeAttribute("user");
		session.invalidate();
		System.out.println("Session status" + session == null);
		return new ModelAndView("index");
	}

}
