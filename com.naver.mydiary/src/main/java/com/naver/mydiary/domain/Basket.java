package com.naver.mydiary.domain;

public class Basket {
	private int cartid;
	private String email;
	private String nickname;
	private int fruitid;
	private String fruitname;
	private int price;
	private int amount;
	private int money;
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getFruitid() {
		return fruitid;
	}
	public void setFruitid(int fruitid) {
		this.fruitid = fruitid;
	}
	public String getFruitname() {
		return fruitname;
	}
	public void setFruitname(String fruitname) {
		this.fruitname = fruitname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	@Override
	public String toString() {
		return "Basket [cartid=" + cartid + ", email=" + email + ", nickname=" + nickname + ", fruitid=" + fruitid
				+ ", fruitname=" + fruitname + ", price=" + price + ", amount=" + amount + ", money=" + money + "]";
	}

}
