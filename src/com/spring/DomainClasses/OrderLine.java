package com.spring.DomainClasses;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ForeignKey;
import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table(name = "orderline")
public class OrderLine implements Serializable {
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	@ManyToOne
	@ForeignKey(name = "medicine")
	@Autowired
	private Medicine medicine;
	public OrderLine() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Column(name="quantity")
	private Integer quantity;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public OrderLine(Integer id, Medicine medicine, Integer quantity, Double price, Orders orders) {
		super();
		this.id = id;
		this.medicine = medicine;
		this.quantity = quantity;
		this.price = price;
		this.orders = orders;
	}
	public Medicine getMedicine() {
		return medicine;
	}
	public void setMedicine(Medicine medicine) {
		this.medicine = medicine;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	@Column(name="price")
	private Double price;
	@ManyToOne
	@ForeignKey(name = "orders")
	@Autowired
	private Orders orders;
	public OrderLine(Medicine medicine,Integer quantity,Double price,Orders orders) {
		this.medicine = medicine;
		this.quantity = quantity;
		this.price = price;
		this.orders = orders;
	}

}
