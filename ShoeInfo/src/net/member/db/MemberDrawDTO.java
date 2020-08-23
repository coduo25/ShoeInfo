
package net.member.db;

public class MemberDrawDTO {
	
	private String member_email;
	private int model_num;
	private String model_stylecode;
	private String country_name;
	private String brand_id;
	private int draw_count;
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
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
	public int getDraw_count() {
		return draw_count;
	}
	public void setDraw_count(int draw_count) {
		this.draw_count = draw_count;
	}
}