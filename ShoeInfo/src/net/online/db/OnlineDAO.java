package net.online.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.brand.db.BrandDTO;

public class OnlineDAO {
	
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
	
	//신발 온라인 정보 저장하는 함수
	public void insertOnlineInfo(OnlineDTO odto) {
		int online_num = 0;
		try {
			con = getConnection();
			//draw_num 계산
			sql = "select max(online_num) from shoeinfo_onlineinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				online_num = rs.getInt(1) + 1;
			}
			sql = "insert into shoeinfo_onlineinfo values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, online_num);
			pstmt.setString(2, odto.getModel_stylecode());
			pstmt.setString(3, odto.getCountry_region());
			pstmt.setString(4, odto.getCountry_name());
			pstmt.setString(5, odto.getBrand_id());
			pstmt.setString(6, odto.getOnline_link());
			pstmt.setString(7, odto.getOnline_start_time());
			pstmt.setString(8, odto.getOnline_end_time());
			pstmt.setString(9, odto.getOnline_method());
			pstmt.setString(10, odto.getBuy_method());
			pstmt.setString(11, odto.getDelivery_method());
			pstmt.setString(12, odto.getDescription());	
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	//대한민국 신발 온라인 정보 가져오는 함수(브랜드 정보 + 온라인 정보)
	public Vector getOnlineInfo_kr(String model_stylecode) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		//대한민국(kr) 신발 응모 정보 저장
		//대한민국(kr) 브랜드 정보 저장
		ArrayList onlineInfoList_kr = new ArrayList();
		ArrayList brandList_kr = new ArrayList();
		
		try {	
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, "대한민국");
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setBuy_method(rs.getString("buy_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				odto.setDescription(rs.getString("description"));
				onlineInfoList_kr.add(odto);
				
				//한국 브랜드 정보 가져오기
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, odto.getBrand_id());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					//브랜드 정보 DB에 해당 브랜드가 저장되어있으면
					BrandDTO bdto = new BrandDTO();
					bdto.setCountry_name(rs2.getString("country_name"));
					bdto.setBrand_logo(rs2.getString("brand_logo"));
					bdto.setBrand_name(rs2.getString("brand_name"));
					bdto.setBrand_id(rs2.getString("brand_id"));
					sql="select country_flag from shoeinfo_country where country_name = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setString(1, bdto.getCountry_name());
					rs3 = pstmt3.executeQuery();
					if(rs3.next()){
						bdto.setCountry_flag(rs3.getString("country_flag"));
					}
					brandList_kr.add(bdto);
				}
			}
			vec.add(onlineInfoList_kr);
			vec.add(brandList_kr);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	//Asia(대한민국 빼고)지역 신발 온라인 정보 가져오는 함수(브랜드 정보 + 응모 정보)
	public Vector getOnlineInfo_asia(String model_stylecode) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		//아시아-대한민국 빼고(asia) 신발 온라인 정보 저장
		//아시아-대한민국 빼고(asia) 브랜드 정보 저장
		ArrayList onlineInfoList_asia = new ArrayList();
		ArrayList brandList_asia = new ArrayList();
		
		try {	
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_region = ? AND NOT country_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, "아시아");
			pstmt.setString(3, "대한민국");
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setBuy_method(rs.getString("buy_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				odto.setDescription(rs.getString("description"));
				onlineInfoList_asia.add(odto);
				
				//아시아 브랜드 정보 가져오기
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, odto.getBrand_id());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					//브랜드 정보 DB에 해당 브랜드가 저장되어있으면
					BrandDTO bdto = new BrandDTO();
					bdto.setCountry_name(rs2.getString("country_name"));
					bdto.setBrand_logo(rs2.getString("brand_logo"));
					bdto.setBrand_name(rs2.getString("brand_name"));
					bdto.setBrand_id(rs2.getString("brand_id"));
					
					sql="select country_flag from shoeinfo_country where country_name = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setString(1, bdto.getCountry_name());
					rs3 = pstmt3.executeQuery();
					if(rs3.next()){
						bdto.setCountry_flag(rs3.getString("country_flag"));
					}
					brandList_asia.add(bdto);
				}
			}
			vec.add(onlineInfoList_asia);
			vec.add(brandList_asia);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	public Vector getOnlineInfo(String model_stylecode, String country_region) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		ArrayList onlineInfoList = new ArrayList();
		ArrayList brandList = new ArrayList();
		
		try {
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_region = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, country_region);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setBuy_method(rs.getString("buy_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				odto.setDescription(rs.getString("description"));
				onlineInfoList.add(odto);
				
				//아메리카 브랜드 정보 가져오기
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, odto.getBrand_id());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					//브랜드 정보 DB에 해당 브랜드가 저장되어있으면
					BrandDTO bdto = new BrandDTO();
					bdto.setCountry_name(rs2.getString("country_name"));
					bdto.setBrand_logo(rs2.getString("brand_logo"));
					bdto.setBrand_name(rs2.getString("brand_name"));
					bdto.setBrand_id(rs2.getString("brand_id"));
					
					sql="select country_flag from shoeinfo_country where country_name = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setString(1, bdto.getCountry_name());
					rs3 = pstmt3.executeQuery();
					if(rs3.next()){
						bdto.setCountry_flag(rs3.getString("country_flag"));
					}
					brandList.add(bdto);
				}
			}
			vec.add(onlineInfoList);
			vec.add(brandList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	//model_stylcode와 brand_id만 가지고 해당 브랜드 발매 정보 수정하기 위해서 정보 가져오는 함수(관리자만)
	public OnlineDTO getOneOnlineInfo(String model_stylecode, String brand_id){
		OnlineDTO odto = null;
		try {
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND brand_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, brand_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				odto = new OnlineDTO();
				odto.setOnline_num(rs.getInt("online_num"));
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setBuy_method(rs.getString("buy_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				odto.setDescription(rs.getString("description"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
		return odto;
	}
	
	//신발 온라인 정보 수정하는 함수
	public void updateOnlineinfo(OnlineDTO odto){
		try {
			con = getConnection();
			sql = "update shoeinfo_onlineinfo set model_stylecode = ?, country_region = ?, country_name = ?, brand_id = ?, online_link = ?, online_start_time = ?, online_end_time = ?, online_method = ?, buy_method = ?, delivery_method = ?, description = ? where model_stylecode = ? AND brand_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, odto.getModel_stylecode());
			pstmt.setString(2, odto.getCountry_region());
			pstmt.setString(3, odto.getCountry_name());
			pstmt.setString(4, odto.getBrand_id());
			pstmt.setString(5, odto.getOnline_link());
			pstmt.setString(6, odto.getOnline_start_time());
			pstmt.setString(7, odto.getOnline_end_time());
			pstmt.setString(8, odto.getOnline_method());
			pstmt.setString(9, odto.getBuy_method());
			pstmt.setString(10, odto.getDelivery_method());
			pstmt.setString(11, odto.getDescription());
			pstmt.setString(12, odto.getModel_stylecode());
			pstmt.setString(13, odto.getBrand_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
	}
	
	
}