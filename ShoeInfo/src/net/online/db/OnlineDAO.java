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

import net.board.action.Criteria;
import net.brand.db.BrandDTO;
import net.sneaker.db.SneakerDTO;

public class OnlineDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	
	// 디비 연결(커넥션 풀 사용)
	private Connection getConnection() throws Exception{
		// Context 객체를 생성
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/coduo25");
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
	
	//모든 온라인정보수 계산하는 함수
	public int countOnlineInfo(){
		int num = 0;
		try {
			con = getConnection();
			sql = "select online_link from shoeinfo_onlineinfo";
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
	
	//신발 온라인 정보 저장하는 함수
	public int insertOnlineInfo(OnlineDTO odto) {
		int check = -1;
		int online_num = 0;
		
		try {
			con = getConnection();
			
			//중복 데이터가 있는지 체크하기
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? and brand_id = ? and model_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, odto.getModel_stylecode());
			pstmt.setString(2, odto.getBrand_id());
			pstmt.setInt(3, odto.getModel_num());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				//중복 데이터가 있으면
				check = 0;
			}
			//중복 데이터가 없으면
			else {
				//draw_num 계산
				sql = "select max(online_num) from shoeinfo_onlineinfo";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					online_num = rs.getInt(1) + 1;
				}
				
				sql = "insert into shoeinfo_onlineinfo values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, online_num);
				pstmt.setInt(2, odto.getModel_num());
				pstmt.setString(3, odto.getModel_stylecode());
				pstmt.setString(4, odto.getCountry_region());
				pstmt.setString(5, odto.getCountry_name());
				pstmt.setString(6, odto.getBrand_id());
				pstmt.setString(7, odto.getOnline_link());
				pstmt.setString(8, odto.getOnline_start_date());
				pstmt.setString(9, odto.getOnline_start_time());
				pstmt.setString(10, odto.getOnline_end_date());
				pstmt.setString(11, odto.getOnline_end_time());
				pstmt.setString(12, odto.getOnline_method());
				pstmt.setString(13, odto.getBuy_method());
				pstmt.setString(14, odto.getDelivery_method());
				pstmt.setString(15, odto.getOnline_writer());
				pstmt.setTimestamp(16, odto.getReg_date());
				pstmt.executeUpdate();
				check = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	
	//신발 삭제하는 함수
	public void deleteSneaker(String model_stylecode, int num){
		int check = 0;
		try {
			con = getConnection();
			sql = "delete from shoeinfo_sneakerlibrary where model_stylecode = ? and num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setInt(2, num);
			check = pstmt.executeUpdate();
			if(check>0){
				sql = "delete from shoeinfo_onlineinfo where model_stylecode = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, model_stylecode);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	//모든 온라인 info 가져오는 함수
	public Vector getAllOnlineInfo(Criteria cri) {
		Vector vec = new Vector();
		
		ArrayList onlineInfoList = new ArrayList();
		ArrayList sneakerInfoList = new ArrayList();
		ArrayList brandInfoList = new ArrayList();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		try{
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo order by online_num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cri.getPageStart());
			pstmt.setInt(2, cri.getPerpageNum());
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setBuy_method(rs.getString("buy_method"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				odto.setModel_num(rs.getInt("model_num"));
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setOnline_num(rs.getInt("online_num"));
				odto.setOnline_writer(rs.getString("online_writer"));
				odto.setReg_date(rs.getTimestamp("reg_date"));
				onlineInfoList.add(odto);
				
				sql = "select * from shoeinfo_sneakerlibrary where num = ? and model_stylecode = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, odto.getModel_num());
				pstmt2.setString(2, odto.getModel_stylecode());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					SneakerDTO sdto = new SneakerDTO();
					sdto.setImage(rs2.getString("image"));
					sneakerInfoList.add(sdto);
					
					sql="select * from shoeinfo_brand where brand_id = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setString(1, odto.getBrand_id());
					rs3 = pstmt3.executeQuery();
					if(rs3.next()){
						BrandDTO bdto = new BrandDTO();
						bdto.setBrand_id(rs3.getString("brand_id"));
						bdto.setBrand_logo(rs3.getString("brand_logo"));
						bdto.setBrand_name(rs3.getString("brand_name"));
						brandInfoList.add(bdto);
					}
				}
			}
			vec.add(onlineInfoList);
			vec.add(sneakerInfoList);
			vec.add(brandInfoList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	
	//대한민국 신발 온라인 정보 가져오는 함수(브랜드 정보 + 온라인 정보)
	public Vector getOnlineInfo_kr(String model_stylecode, int model_num) {
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
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_name = ? AND model_num = ? order by online_end_date, online_end_time, online_start_date, online_start_time";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, "대한민국");
			pstmt.setInt(3, model_num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_date(rs.getString("online_start_date"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_date(rs.getString("online_end_date"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setBuy_method(rs.getString("buy_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				odto.setOnline_writer(rs.getString("online_writer").substring(0, rs.getString("online_writer").indexOf("@")));
				odto.setReg_date(rs.getTimestamp("reg_date"));
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
	public Vector getOnlineInfo_asia(String model_stylecode, int model_num) {
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
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_region = ? AND model_num = ? AND NOT country_name = ? order by online_end_date, online_end_time, online_start_date, online_start_time";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, "아시아");
			pstmt.setInt(3, model_num);
			pstmt.setString(4, "대한민국");
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_date(rs.getString("online_start_date"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_date(rs.getString("online_end_date"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setBuy_method(rs.getString("buy_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				odto.setOnline_writer(rs.getString("online_writer").substring(0, rs.getString("online_writer").indexOf("@")));
				odto.setReg_date(rs.getTimestamp("reg_date"));
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
	
	public Vector getOnlineInfo(String model_stylecode, String country_region, int model_num) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		ArrayList onlineInfoList = new ArrayList();
		ArrayList brandList = new ArrayList();
		
		try {
			con = getConnection();
			sql = "select * from shoeinfo_onlineinfo where model_stylecode = ? AND country_region = ? AND model_num = ? order by online_end_date, online_end_time, online_start_date, online_start_time";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, country_region);
			pstmt.setInt(3, model_num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OnlineDTO odto = new OnlineDTO();
				odto.setModel_stylecode(rs.getString("model_stylecode"));
				odto.setCountry_region(rs.getString("country_region"));
				odto.setCountry_name(rs.getString("country_name"));
				odto.setBrand_id(rs.getString("brand_id"));
				odto.setOnline_link(rs.getString("online_link"));
				odto.setOnline_start_date(rs.getString("online_start_date"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_date(rs.getString("online_end_date"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setBuy_method(rs.getString("buy_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				odto.setOnline_writer(rs.getString("online_writer").substring(0, rs.getString("online_writer").indexOf("@")));
				odto.setReg_date(rs.getTimestamp("reg_date"));
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
				odto.setOnline_start_date(rs.getString("online_start_date"));
				odto.setOnline_start_time(rs.getString("online_start_time"));
				odto.setOnline_end_date(rs.getString("online_end_date"));
				odto.setOnline_end_time(rs.getString("online_end_time"));
				odto.setOnline_method(rs.getString("online_method"));
				odto.setBuy_method(rs.getString("buy_method"));
				odto.setDelivery_method(rs.getString("delivery_method"));
				odto.setOnline_writer(rs.getString("online_writer"));
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
			sql = "update shoeinfo_onlineinfo set model_num = ?, model_stylecode = ?, country_region = ?, country_name = ?, brand_id = ?, online_link = ?, online_start_date = ?, online_start_time = ?, online_end_date = ?, online_end_time = ?, online_method = ?, buy_method = ?, delivery_method = ?, online_writer = ?, reg_date = ? where online_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, odto.getModel_num());
			pstmt.setString(2, odto.getModel_stylecode());
			pstmt.setString(3, odto.getCountry_region());
			pstmt.setString(4, odto.getCountry_name());
			pstmt.setString(5, odto.getBrand_id());
			pstmt.setString(6, odto.getOnline_link());
			pstmt.setString(7, odto.getOnline_start_date());
			pstmt.setString(8, odto.getOnline_start_time());
			pstmt.setString(9, odto.getOnline_end_date());
			pstmt.setString(10, odto.getOnline_end_time());
			pstmt.setString(11, odto.getOnline_method());
			pstmt.setString(12, odto.getBuy_method());
			pstmt.setString(13, odto.getDelivery_method());
			pstmt.setString(14, odto.getOnline_writer());
			pstmt.setTimestamp(15, odto.getReg_date());
			pstmt.setInt(16, odto.getOnline_num());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
	}
	
	//신발 온라인 정보 삭제하는 함수
	public void deleteOnlineInfo(String model_stylecode, String brand_id, int model_num){
		try {
			con = getConnection();
			sql = "delete from shoeinfo_onlineinfo where model_num = ? AND model_stylecode = ? AND brand_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, model_num);
			pstmt.setString(2, model_stylecode);
			pstmt.setString(3, brand_id);
			pstmt.executeUpdate();
			
			sql = "delete from shoeinfo_memberdrawinfo where model_num = ? and model_stylecode = ? and brand_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, model_num);
			pstmt.setString(2, model_stylecode);
			pstmt.setString(3, brand_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
}