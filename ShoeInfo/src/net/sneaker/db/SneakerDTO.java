package net.sneaker.db;

import java.util.Date;

public class SneakerDTO {

	private String brand;
	private String sub_brand;
	private String brand_index;
	private String image_thumb;
	private String image;
	private String model_stylecode;
	private String model_name;
	private String model_colorway;
	private int price;
	private String release_date;
	private String release_status;
	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getSub_brand() {
		return sub_brand;
	}
	public void setSub_brand(String sub_brand) {
		this.sub_brand = sub_brand;
	}
	public String getBrand_index() {
		return brand_index;
	}
	public void setBrand_index(String brand_index) {
		this.brand_index = brand_index;
	}
	
	public String getImage_thumb() {
		return image_thumb;
	}
	public void setImage_thumb(String image_thumb) {
		this.image_thumb = image_thumb;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getModel_stylecode() {
		return model_stylecode;
	}
	public void setModel_stylecode(String model_stylecode) {
		this.model_stylecode = model_stylecode;
	}
	public String getModel_name() {
		return model_name;
	}
	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}
	public String getModel_colorway() {
		return model_colorway;
	}
	public void setModel_colorway(String model_colorway) {
		this.model_colorway = model_colorway;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRelease_date() {
		return release_date;
	}
	public void setRelease_date(String string) {
		this.release_date = string;
	}
	public String getRelease_status() {
		return release_status;
	}
	public void setRelease_status(String release_status) {
		this.release_status = release_status;
	}
}
