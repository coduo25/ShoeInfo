package net.online.db;

import java.sql.Timestamp;

public class OnlineDTO {

	private int online_num;
	private int model_num;
	private String model_stylecode;
	private String country_region;
	private String country_name;
	private String brand_id;
	private String online_link;
	private String online_start_date;
	private String online_start_time;
	private String online_end_date;
	private String online_end_time;
	private String online_method;
	private String buy_method;
	private String delivery_method;
	private String online_writer;
	private Timestamp reg_date;
	private String winner_time;
	
	public int getOnline_num() {
		return online_num;
	}
	public void setOnline_num(int online_num) {
		this.online_num = online_num;
	}
	public int getModel_num() {
		return model_num;
	}
	public void setModel_num(int model_num) {
		this.model_num = model_num;
	}
	public String getModel_stylecode() {
		return model_stylecode;
	}
	public void setModel_stylecode(String model_stylecode) {
		this.model_stylecode = model_stylecode;
	}
	public String getCountry_region() {
		return country_region;
	}
	public void setCountry_region(String country_region) {
		this.country_region = country_region;
	}
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	public String getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}
	public String getOnline_link() {
		return online_link;
	}
	public void setOnline_link(String online_link) {
		this.online_link = online_link;
	}
	public String getOnline_start_date() {
		return online_start_date;
	}
	public void setOnline_start_date(String online_start_date) {
		this.online_start_date = online_start_date;
	}
	public String getOnline_start_time() {
		return online_start_time;
	}
	public void setOnline_start_time(String online_start_time) {
		this.online_start_time = online_start_time;
	}
	public String getOnline_end_date() {
		return online_end_date;
	}
	public void setOnline_end_date(String online_end_date) {
		this.online_end_date = online_end_date;
	}
	public String getOnline_end_time() {
		return online_end_time;
	}
	public void setOnline_end_time(String online_end_time) {
		this.online_end_time = online_end_time;
	}
	public String getOnline_method() {
		return online_method;
	}
	public void setOnline_method(String online_method) {
		this.online_method = online_method;
	}
	public String getBuy_method() {
		return buy_method;
	}
	public void setBuy_method(String buy_method) {
		this.buy_method = buy_method;
	}
	public String getDelivery_method() {
		return delivery_method;
	}
	public void setDelivery_method(String delivery_method) {
		this.delivery_method = delivery_method;
	}
	public String getOnline_writer() {
		return online_writer;
	}
	public void setOnline_writer(String online_writer) {
		this.online_writer = online_writer;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getWinner_time() {
		return winner_time;
	}
	public void setWinner_time(String winner_time) {
		this.winner_time = winner_time;
	}
	
}
