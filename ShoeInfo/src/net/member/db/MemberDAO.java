package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.board.action.Criteria;
import net.brand.db.BrandDTO;
import net.sneaker.db.SneakerDTO;

public class MemberDAO {
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
	
	//모든 회원수 계산하는 함수
	public int countMember(){
		int num = 0;
		try {
			con = getConnection();
			sql = "select email from shoeinfo_member";
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
	
	//모든 회원 리스트 불러오는 함수
	public List<MemberDTO> getAllMemberList(Criteria cri){
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		try {
			con = getConnection();
			sql = "select * from shoeinfo_member order by count";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDTO mdto = new MemberDTO();
				mdto.setEmail(rs.getString("email"));
				mdto.setPass(rs.getString("pass"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));
				mdto.setPosition(rs.getString("position"));
				memberList.add(mdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return memberList;
	}
	
	//모든 회원이 응모한 횟수 계산하는 함수
	public int countTotalDraw(){
		int num = 0;
		try {
			con = getConnection();
			sql = "select userDraw_num from shoeinfo_memberdrawinfo";
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
	
	//회원 추가하는 함수
	public void insertMember(MemberDTO mdto){
		int count = 0;
		try {
			con = getConnection();
			sql = "select max(count) from shoeinfo_member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into shoeinfo_member(count, email, pass, name, phone, reg_date, position, salt) values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, mdto.getEmail());
			pstmt.setString(3, mdto.getPass());
			pstmt.setString(4, mdto.getName());
			pstmt.setString(5, mdto.getPhone());
			pstmt.setTimestamp(6, mdto.getReg_date());
			pstmt.setString(7, "user");
			pstmt.setString(8, mdto.getSalt());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//이메일에 해당하는 salt 값 가져오는 함수
	public String getSaltByEmail(String email){
		String salt = "";
		try {
			con = getConnection();
			sql = "select salt from shoeinfo_member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()){
				salt = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return salt;
	}
	
	//회원가입 할때 이메일 중복 체크하는 함수
	public int joinEmailCheck(String email){
		int check = -1;
		try {
			con = getConnection();
			sql = "select email from shoeinfo_member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = 0;
			}else {
				check = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	
	//로그인할때 이메일 체크 하는 함수
	public int loginEmailCheck(String email, String pass){
		int check = -1;
		try {
			con = getConnection();
			sql = "select pass from shoeinfo_member where BINARY email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();			

			if(rs.next()){
               if(pass.equals(rs.getString("pass"))){
            	   check = 1;            	   
               }else{
            	   check = 0;
               }
			}else{
				check = -1;
			}
			//System.out.println("이메일 체크 완료 : "+check);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}	
		return check;
	}
	
	//회원 정보 수정하는 함수 
	public int modiMemberInfo(MemberDTO mdto) {
		int check = -1;
		try {
			con = getConnection();
			sql = "select email from shoeinfo_member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getEmail());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sql = "update shoeinfo_member set pass = ?, name = ?, phone = ?, salt = ? where email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mdto.getPass());
				pstmt.setString(2, mdto.getName());
				pstmt.setString(3, mdto.getPhone());
				pstmt.setString(4, mdto.getSalt());
				pstmt.setString(5, mdto.getEmail());
				pstmt.executeUpdate();	
				check = 1;
			}
			else {
				check = 0;
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	
	//회원 아아디 찾는 함수
	public String findEmail(String name, String phone){
		String email = "";
		try {
			con = getConnection();
			sql = "select email from shoeinfo_member where name = ? and phone = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//DB에 메일이 존재하면
				email = rs.getString(1);
			}else {
				//DB에 메일이 존재하지 않으면
				email = "NOEMAIL";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return email;
	}
	
	//회원 비밀번호 찾는 함수
	public String findPW(String name, String email){
		String checkEmail = "";
		try {
			con = getConnection();
			sql = "select email from shoeinfo_member where name = ? and email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//DB에 메일이 존재하면
				checkEmail = rs.getString(1);
			}else {
				//DB에 메일이 존재하지 않으면
				checkEmail = "NOEMAIL";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return checkEmail;
	}
	
	//회원 비밀번호 재설정 하는 함수
	public int changePass(String email, String pass){
		int check = -1; 
		try {
			con = getConnection();
			sql = "select email from shoeinfo_member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sql = "update shoeinfo_member set pass = ? where email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pass);
				pstmt.setString(2, email);
				pstmt.executeUpdate();	
				check = 1;
			}
			else {
				check = 0;
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	
	//position 체크 하는 함수
	public String positionCheck(String email){
		String position = "";
		try {
			con = getConnection();
			sql = "select position from shoeinfo_member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				position = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return position;
	}
	
	//회원 응모 정보 추가하는 함수
	public void insertUserDrawInfo(MemberDrawDTO mddto){
		int userDraw_num = 0;
		int userDraw_count = 0;
		try {
			con = getConnection();
			sql = "select Max(userDraw_num) from shoeinfo_memberdrawinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				userDraw_num = rs.getInt(1) + 1;
			}
			sql = "select Max(draw_count) from shoeinfo_memberdrawinfo where member_email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mddto.getMember_email());
			rs = pstmt.executeQuery();
			if(rs.next()){
				userDraw_count = rs.getInt(1) + 1;
			}
			sql = "insert into shoeinfo_memberdrawinfo values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userDraw_num);
			pstmt.setString(2, mddto.getMember_email());
			pstmt.setString(3, mddto.getModel_stylecode());
			pstmt.setString(4, mddto.getCountry_name());
			pstmt.setString(5, mddto.getBrand_id());
			pstmt.setInt(6, userDraw_count);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//회원 응모 정보 삭제하는 함수
	public void deleteUserDrawInfo(MemberDrawDTO mddto){
		int userDraw_num = 0;
		int userDraw_count = 0;
		try {
			con = getConnection();
			sql = "delete from shoeinfo_memberdrawinfo where member_email = ? AND model_stylecode = ? AND brand_id = ? AND country_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mddto.getMember_email());
			pstmt.setString(2, mddto.getModel_stylecode());
			pstmt.setString(3, mddto.getBrand_id());
			pstmt.setString(4, mddto.getCountry_name());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			closeDB();
		}
	}
	
	//사용자의 응모 정보 불러오는 함수
	public ArrayList<String> searchDrawBrandInfo(String user, String model_stylecode) {
		ArrayList<String> userDrawBrandList = new ArrayList();
		try {
			con = getConnection();
			sql = "select distinct brand_id from shoeinfo_memberdrawinfo where member_email = ? AND model_stylecode = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user);
			pstmt.setString(2, model_stylecode);
			rs = pstmt.executeQuery();
			while(rs.next()){
				userDrawBrandList.add(rs.getString("brand_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return userDrawBrandList;
	}
	
	//사용자의 월별 응모 브랜드 정보 불러오는 함수
	public Vector searchUserDrawStylecode_kr(String user, String date) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		ArrayList userDrawStylecodeList = new ArrayList();
		ArrayList sneakerInfoList = new ArrayList();
		
		try {
			con = getConnection();
			sql = "select distinct model_stylecode from shoeinfo_memberdrawinfo where member_email = ? order by draw_count desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberDrawDTO mddto = new MemberDrawDTO();
				mddto.setModel_stylecode(rs.getString("model_stylecode"));
				
				//해당 브랜드 정보 가져오기
				sql = "select * from shoeinfo_sneakerlibrary where model_stylecode = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, mddto.getModel_stylecode());
				rs2 = pstmt2.executeQuery();
				
				if(rs2.next()){

					//가지고온 스니커 정보중에 release_date에 date가 포함되어있으면 list에 추가하기
					if(rs2.getString("release_date").contains(date)){
						
						userDrawStylecodeList.add(mddto);
						
						//스니커 정보 DB에 해당 스니커가 저장되어있으면
						SneakerDTO sdto = new SneakerDTO();
						sdto.setModel_stylecode(rs2.getString("model_stylecode"));
						sdto.setImage(rs2.getString("image"));
						sdto.setRelease_date(rs2.getString("release_date"));
						sneakerInfoList.add(sdto);
					}	
				}
			}
			vec.add(userDrawStylecodeList);
			vec.add(sneakerInfoList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	//사용자가 응모한 대한민국 브랜드 정보 불러오는 함수
	public Vector getDrawInfo_kr(String model_stylecode, String email) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		//대한민국 신발 응모 정보 저장
		//브랜드 정보 저장
		ArrayList drawInfoList_kr = new ArrayList();
		ArrayList brandList_kr = new ArrayList();
		
		try {	
			con = getConnection();
			sql = "select * from shoeinfo_memberdrawinfo where model_stylecode = ? AND member_email = ? AND country_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, email);
			pstmt.setString(3, "대한민국");
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDrawDTO mddto = new MemberDrawDTO();
				mddto.setBrand_id(rs.getString("brand_id"));
				mddto.setModel_stylecode(rs.getString("model_stylecode"));
				drawInfoList_kr.add(mddto);
				
				//한국 브랜드 정보 가져오기
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, mddto.getBrand_id());
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
			vec.add(drawInfoList_kr);
			vec.add(brandList_kr);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	//사용자가 응모한 대한민국외의 해외 브랜드 정보 불러오는 함수
	public Vector getDrawInfo_etc(String model_stylecode, String email) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		//해외 신발 응모 정보 저장
		//브랜드 정보 저장
		ArrayList drawInfoList_etc = new ArrayList();
		ArrayList brandList_etc = new ArrayList();
		
		try {	
			con = getConnection();
			sql = "select * from shoeinfo_memberdrawinfo where model_stylecode = ? AND member_email = ? AND not country_name = ? order by draw_count";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model_stylecode);
			pstmt.setString(2, email);
			pstmt.setString(3, "대한민국");
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDrawDTO mddto = new MemberDrawDTO();
				mddto.setBrand_id(rs.getString("brand_id"));
				mddto.setModel_stylecode(rs.getString("model_stylecode"));
				drawInfoList_etc.add(mddto);
				
				//한국 브랜드 정보 가져오기
				sql = "select * from shoeinfo_brand where brand_id = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, mddto.getBrand_id());
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
					brandList_etc.add(bdto);
				}
			}
			vec.add(drawInfoList_etc);
			vec.add(brandList_etc);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
	}
	
	//회원 정보 가져오는 함수
	public MemberDTO getMemberInfo(String email){
		MemberDTO mdto = new MemberDTO();
		try {
			con = getConnection();
			sql = "select * from shoeinfo_member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				mdto.setEmail(email);
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return mdto;		
	}
	
	//브랜드 요청 처리하는 함수
	public void requestBrand(String brandName, String brandURL){
		int num = 0;
		try {
			con = getConnection();
			sql = "select max(req_num) from shoeinfo_memberBrandReq";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}
			
			sql = "insert into shoeinfo_memberBrandReq values(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, brandName);
			pstmt.setString(3, brandURL);
			pstmt.setString(4, "false");
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	
}