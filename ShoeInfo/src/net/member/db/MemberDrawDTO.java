
package net.member.db;

public class MemberDrawDTO {
	
	private String member_id;
	private String model_stylecode;
	private String country_name;
	private String brand_id;
	private String draw_count;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	public String getDraw_count() {
		return draw_count;
	}
	public void setDraw_count(String draw_count) {
		this.draw_count = draw_count;
	}
}