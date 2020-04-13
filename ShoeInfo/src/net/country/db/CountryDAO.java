package net.country.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CountryDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	
	// ��� ����(Ŀ�ؼ� Ǯ ���)
	private Connection getConnection() throws Exception{
		// Context ��ü�� ����
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/shoeinfo");
		con = ds.getConnection();
		return con;
	}
	// �ڿ� ���� 
	public void closeDB(){
		try {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(con !=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//���ο� ���� �߰��ϴ� �Լ�
	public void insertNewCountry(CountryDTO ctdo){
		try {
			con = getConnection();
			sql = "insert into shoeinfo_country values(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ctdo.getCountry_region());
			pstmt.setString(2, ctdo.getCountry_name());
			pstmt.setString(3, ctdo.getCountry_code());
			pstmt.setString(4, ctdo.getCountry_flag());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//���� ����Ʈ �������� �Լ�
	public List<CountryDTO> countryList_all(){
		List<CountryDTO> countryAllList = new ArrayList();
		try {
			con = getConnection();
			sql = "select * from shoeinfo_country order by country_name";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CountryDTO cdto = new CountryDTO();
				cdto.setCountry_name(rs.getString("country_name"));
				cdto.setCountry_code(rs.getString("country_code"));
				cdto.setCountry_region(rs.getString("country_region"));
				countryAllList.add(cdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return countryAllList;
	}
	
	//�������� �������� �Լ�
	public String getCountry_region(String country_name) {
		String country_region = "";
		try {
			con = getConnection();
			sql = "select country_region from shoeinfo_country where country_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, country_name);
			rs = pstmt.executeQuery();
			if(rs.next()){
				country_region = rs.getString("country_region");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return country_region;
	}

}
