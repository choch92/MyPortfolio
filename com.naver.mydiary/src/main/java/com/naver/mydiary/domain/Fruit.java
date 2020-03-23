package com.naver.mydiary.domain;

public class Fruit {
	public Integer fruitid;
	public String fruitname;
	public Integer price;
	public String description;
	public String pictureurl;
	public Integer getFruitid() {
		return fruitid;
	}
	public void setFruitid(Integer fruitid) {
		this.fruitid = fruitid;
	}
	public String getFruitname() {
		return fruitname;
	}
	public void setFruitname(String fruitname) {
		this.fruitname = fruitname;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPictureurl() {
		return pictureurl;
	}
	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
	}
	@Override
	public String toString() {
		return "Fruit [fruitid=" + fruitid + ", fruitname=" + fruitname + ", price=" + price + ", description="
				+ description + ", pictureurl=" + pictureurl + "]";
	}
}
