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

import net.board.action.Criteria;
import net.brand.db.BrandDTO;

public class CountryDAO {
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
	
	//전체 국가 수 구하는 함수
	public int countCountry(){
		int num = 0;
		try {
			con = getConnection();
			sql = "select * from shoeinfo_country";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				num += 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return num;
	}
	
	//새로운 나라 추가하는 함수
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
	
	//관리자 권한 모든 국가 리스트 가져오는 함수
	public List<CountryDTO> getAllCountryList(Criteria cri) {
		ArrayList<CountryDTO> countryList = new ArrayList<CountryDTO>();
		try {
			con = getConnection();
			sql = "select * from shoeinfo_country order by country_name limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cri.getPageStart());
			pstmt.setInt(2, cri.getPerpageNum());
			rs = pstmt.executeQuery();
			while(rs.next()){
				CountryDTO cdto = new CountryDTO();
				cdto.setCountry_region(rs.getString("country_region"));
				cdto.setCountry_flag(rs.getString("country_flag"));
				cdto.setCountry_name(rs.getString("country_name"));
				cdto.setCountry_code(rs.getString("country_code"));
				countryList.add(cdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return countryList;
	}
	
	//국가 리스트 가져오는 함수
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
	
	//국가지역 가져오는 함수
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