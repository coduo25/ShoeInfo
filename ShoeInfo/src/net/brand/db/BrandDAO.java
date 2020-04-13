package net.brand.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BrandDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	
	// 디비 연결(커넥션 풀 사용)
	private Connection getConnection() throws Exception{
		// Context 객체를 생성
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/shoeinfo");
		con = ds.getConnection();
		return con;
	}
	// 자원 해제 
	public void closeDB(){
		try {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(con !=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//새로운 브랜드 저장하는 함수
	public void insertNewBrand(BrandDTO bdto) {
		try {
			con = getConnection();
			sql = "insert into shoeinfo_brand values(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bdto.getCountry_name());
			pstmt.setString(2, bdto.getBrand_logo());
			pstmt.setString(3, bdto.getBrand_name());
			pstmt.setString(4, bdto.getBrand_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//브랜드별 국가리스트 가져오는 함수
	public List<BrandDTO> searchCountryList_bybrand() {
		List<BrandDTO> brandList = new ArrayList();
		try {
			con = getConnection();
			sql = "select distinct country_name from shoeinfo_brand";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BrandDTO bdto = new BrandDTO();
				bdto.setCountry_name(rs.getString("country_name"));
				brandList.add(bdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return brandList;
	}
	
	//국가별 브랜드 찾아오는 함수
	public List<BrandDTO> searchBrand(String country_name) {
		List<BrandDTO> brandNameList = new ArrayList();
		try {
			con = getConnection();
			sql = "select distinct brand_name from shoeinfo_brand where country_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, country_name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BrandDTO bdto = new BrandDTO();
				bdto.setBrand_name(rs.getString("brand_name"));
				brandNameList.add(bdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return brandNameList;
	}
	
	//country와 brand_name으로 brand_id값 찾아오는 함수
	public String searchBrand_id(String country_name, String brand_name) {
		String brand_id = "";
		try {
			con = getConnection();
			sql = "select brand_id from shoeinfo_brand where country_name = ? AND brand_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, country_name);
			pstmt.setString(2, brand_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				brand_id = rs.getString("brand_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return brand_id;
	}
		
		
		
		
}
