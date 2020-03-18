package com.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.DomainClasses.OrderLine;
import com.spring.Services.OrderLineService;

@Controller
public class OrderLineController {
    @Autowired
	private OrderLineService orderLineService;
	@RequestMapping("saveQuantity")
	public String updateQuantity(@RequestParam("orderLineId")Integer orderLineId,@RequestParam("quantity")Integer quantity) {
		OrderLine orderLineIns = orderLineService.getOrderLineById(orderLineId);
		orderLineIns.setQuantity(quantity);
		orderLineService.update(orderLineIns);
		return "redirect:myCart.do";
	}

}
