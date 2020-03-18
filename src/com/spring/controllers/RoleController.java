package com.spring.controllers;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.DomainClasses.Role;
import com.spring.DomainClasses.User;
import com.spring.Services.RoleService;

@Controller
public class RoleController {
    @Autowired
	RoleService roleService;

	@RequestMapping("createRole")
	public String createRole(@RequestParam("roleName") String roleName) {
		Role roleIns = new Role();
		roleIns.setName(roleName);
		roleService.createRole(roleIns);
		return "redirect:roleList.do";
	}

	@RequestMapping("roleCreate")
	public String create() {
		return "/roleCreate";
	}

	@RequestMapping("/roleList")
	public ModelAndView listRoles(Model model) {
		List<Role> roleList = new ArrayList<Role>();
		roleList = roleService.listRoles();
		model.addAttribute("roleList", roleList);
		System.out.println("sdknskjgd");
		return new ModelAndView("/roleList", "roleList", roleList);
	}

	@RequestMapping("roleShow")
	public ModelAndView showUser(@RequestParam("roleId") String roleId) {
		Role roleIns = roleService.getRoleById(Integer.parseInt(roleId));
		return new ModelAndView("roleShow", "roleIns", roleIns);
	}

	@RequestMapping("roleEdit")
	public ModelAndView edit(@RequestParam("roleId") Integer roleId) {
		Role roleIns = roleService.getRoleById(roleId);
		return new ModelAndView("/roleCreate", "roleIns", roleIns);
	}

	@RequestMapping("roleUpdate")
	public ModelAndView updateUser(@ModelAttribute("role") Role roleIns, Model model) {
		Boolean b = roleService.editRole(roleIns);
		model.addAttribute("message", "Role Updated Successfully!");
		if (b) {
			return new ModelAndView("roleShow", "roleIns", roleIns);
		}
		return null;

	}

	@RequestMapping("roleDelete")
	public String deleteUser(@RequestParam("roleId") Integer roleId) {
		Role roleIns = roleService.getRoleById(roleId);
		Boolean b = roleService.deleteRole(roleIns);
		return "redirect:/roleList.do";
	}

}
