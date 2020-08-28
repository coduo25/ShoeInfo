package net.member.db;

import java.sql.Timestamp;

public class MemberDTO {
	
	private String email;
	private String email_BySHA;
	private String pass;
	private String name;
	private String phone;
	private Timestamp reg_date;
	private String position;
	private String salt;
	private String salt_id;

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_BySHA() {
		return email_BySHA;
	}
	public void setEmail_BySHA(String email_BySHA) {
		this.email_BySHA = email_BySHA;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getSalt_id() {
		return salt_id;
	}
	public void setSalt_id(String salt_id) {
		this.salt_id = salt_id;
	}
	
}
