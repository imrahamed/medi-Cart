package com.spring.DomainClasses;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ForeignKey;
import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table(name = "medicine")
public class Medicine {
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	@Column(name="medicineName")
	private String medicineName;
	@Column(name="description")
	private String description;
	@Column(name="imageURL")
	private String imageURL;
	@Column(name="actualPrice")
	private Double actualPrice;
	@Column(name="discountPrice")
	private Double discountPrice;
	@Column(name="quantity")
	private Integer quantity;
	@ManyToOne
	@ForeignKey(name = "brand")
	@Autowired
	private Brand brand;
	@ManyToOne
	@ForeignKey(name = "category")
	@Autowired
	private Category category;
	@Column(name="isBlocked")
	private Boolean isBlocked = false;
	public Boolean getIsBlocked() {
		return isBlocked;
	}
	public void setIsBlocked(Boolean isBlocked) {
		this.isBlocked = isBlocked;
	}
	public Medicine(Integer id, String medicineName, String description, String imageURL, Double actualPrice,
			Double discountPrice, Integer quantity, Brand brand, Category category, Boolean isBlocked) {
		super();
		this.id = id;
		this.medicineName = medicineName;
		this.description = description;
		this.imageURL = imageURL;
		this.actualPrice = actualPrice;
		this.discountPrice = discountPrice;
		this.quantity = quantity;
		this.brand = brand;
		this.category = category;
		this.isBlocked = isBlocked;
	}
	public Medicine(Integer id, String medicineName, String description, String imageURL, Double actualPrice,
			Double discountPrice, Integer quantity, Brand brand, Category category) {
		super();
		this.id = id;
		this.medicineName = medicineName;
		this.description = description;
		this.imageURL = imageURL;
		this.actualPrice = actualPrice;
		this.discountPrice = discountPrice;
		this.quantity = quantity;
		this.brand = brand;
		this.category = category;
	}
	public Medicine() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Medicine(Integer id, String medicineName, String description, Double actualPrice, Double discountPrice,
			Integer quantity, Brand brand) {
		super();
		this.id = id;
		this.medicineName = medicineName;
		this.description = description;
		this.actualPrice = actualPrice;
		this.discountPrice = discountPrice;
		this.quantity = quantity;
		this.brand = brand;
	}
	public Medicine(String medicineName, String description, Double actualPrice, Double discountPrice, Integer quantity,
			Brand brand, Category category) {
		super();
		this.medicineName = medicineName;
		this.description = description;
		this.actualPrice = actualPrice;
		this.discountPrice = discountPrice;
		this.quantity = quantity;
		this.brand = brand;
		this.category = category;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getActualPrice() {
		return actualPrice;
	}
	public void setActualPrice(Double actualPrice) {
		this.actualPrice = actualPrice;
	}
	public Double getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(Double discountPrice) {
		this.discountPrice = discountPrice;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Medicine(Integer id, String medicineName, String description, Double actualPrice, Double discountPrice,
			Integer quantity, Brand brand, Category category,String imageURL) {
		super();
		this.id = id;
		this.medicineName = medicineName;
		this.description = description;
		this.actualPrice = actualPrice;
		this.discountPrice = discountPrice;
		this.quantity = quantity;
		this.brand = brand;
		this.category = category;
		this.imageURL = imageURL;
	}
	public Medicine(String medicineName, String description, Double actualPrice, Double discountPrice,
			Integer quantity, Brand brand, Category category,String imageURL) {
		super();
		this.id = id;
		this.medicineName = medicineName;
		this.description = description;
		this.actualPrice = actualPrice;
		this.discountPrice = discountPrice;
		this.quantity = quantity;
		this.brand = brand;
		this.category = category;
		this.imageURL = imageURL;
	}
	public Medicine(Integer id,	String medicineName, String description, Double actualPrice, Double discountPrice,
			Integer quantity, Brand brand, Category category) {
		super();
		this.id = id;
		this.medicineName = medicineName;
		this.description = description;
		this.actualPrice = actualPrice;
		this.discountPrice = discountPrice;
		this.quantity = quantity;
		this.brand = brand;
		this.category = category;
		this.imageURL = imageURL;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
