package net.offline.db;

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
import net.online.db.OnlineDTO;

public class OfflineDAO {

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
	
	//신발 오프라인 정보 저장하는 함수
	public void insertOfflineInfo(OfflineDTO odto) {
		int offline_num = 0;
		try {
			con = getConnection();
			//draw_num 계산
			sql = "select max(offline_num) from shoeinfo_offlineinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				offline_num = rs.getInt(1) + 1;
			}
			sql = "insert into shoeinfo_offlineinfo values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, offline_num);
			pstmt.setString(2, odto.getModel_stylecode());
			pstmt.setString(3, odto.getCountry_name());
			pstmt.setString(4, odto.getBrand_id());
			pstmt.setString(5, odto.getOffline_location());
			pstmt.setString(6, odto.getOffline_link());
			pstmt.setString(7, odto.getOffline_start_time());
			pstmt.setString(8, odto.getOffline_end_time());
			pstmt.setString(9, odto.getOffline_method());
			pstmt.setString(10, odto.getDescription());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//대한민국 신발 오프라인 정보 가져오는 함수(브랜드 정보 + 온라인 정보)
	public Vector getOfflineInfo_kr(String model_stylecode) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		//대한민국(kr) 신발 오프라인 정보 저장
		//대한민국(kr) 브랜드 정보 저장
		ArrayList offlineInfoList_kr = new ArrayList();
		ArrayList brandList_kr = new ArrayList();
		
		try {	
			con = getConnection();
			sql = "select * from shoeinfo_offlineinfo where model_stylecode = ? AND country_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, "대한민국");
			rs = pstmt.executeQuery();
			while(rs.next()){
				OfflineDTO ofdto = new OfflineDTO();
				ofdto.setModel_stylecode(rs.getString("model_stylecode"));
				ofdto.setCountry_name(rs.getString("country_name"));
				ofdto.setBrand_id(rs.getString("brand_id"));
				ofdto.setOffline_location(rs.getString("offline_location"));
				ofdto.setOffline_link(rs.getString("offline_link"));
				ofdto.setOffline_start_time(rs.getString("offline_start_time"));
				ofdto.setOffline_end_time(rs.getString("offline_end_time"));
				ofdto.setOffline_method(rs.getString("offline_method"));
				ofdto.setDescription(rs.getString("description"));
				offlineInfoList_kr.add(ofdto);
				
				//한국 브랜드 정보 가져오기
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, ofdto.getBrand_id());
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
			vec.add(offlineInfoList_kr);
			vec.add(brandList_kr);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
}
