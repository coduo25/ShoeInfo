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
import net.online.db.OnlineDTO;
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
		int count = 0;
		
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		try {
			con = getConnection();
			sql = "select * from shoeinfo_member order by count desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cri.getPageStart());
			pstmt.setInt(2, cri.getPerpageNum());
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDTO mdto = new MemberDTO();
				mdto.setCount(rs.getInt("count"));
				mdto.setEmail(rs.getString("email"));
				mdto.setPass(rs.getString("pass"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));
				mdto.setPosition(rs.getString("position"));
				sql = "select max(draw_count) from shoeinfo_memberdrawinfo where member_email = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, mdto.getEmail());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					count = rs2.getInt(1) + 1;
				}
				mdto.setDraw_count(count);
				memberList.add(mdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return memberList;
	}
	
	//모든 회원 응모 리스트 불러오는 함수
	public Vector getAllMemberDrawList(Criteria cri){
		Vector vec = new Vector();
		
		ArrayList memberDrawList = new ArrayList();
		ArrayList sneakerInfoList = new ArrayList();
		ArrayList brandInfoList = new ArrayList();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		try {
			con = getConnection();
			sql = "select * from shoeinfo_memberdrawinfo order by userDraw_num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cri.getPageStart());
			pstmt.setInt(2, cri.getPerpageNum());
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDrawDTO mddto = new MemberDrawDTO();
				mddto.setUserDraw_num(rs.getInt("userDraw_num"));
				mddto.setMember_email(rs.getString("member_email"));
				mddto.setModel_num(rs.getInt("model_num"));
				mddto.setModel_stylecode(rs.getString("model_stylecode"));
				mddto.setCountry_name(rs.getString("country_name"));
				mddto.setBrand_id(rs.getString("brand_id"));
				mddto.setDraw_count(rs.getInt("draw_count"));
				memberDrawList.add(mddto);
				
				sql = "select * from shoeinfo_sneakerlibrary where num = ? and model_stylecode = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, mddto.getModel_num());
				pstmt2.setString(2, mddto.getModel_stylecode());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					SneakerDTO sdto = new SneakerDTO();
					sdto.setImage(rs2.getString("image"));
					sneakerInfoList.add(sdto);
					
					sql="select * from shoeinfo_brand where brand_id = ?";
					pstmt3 = con.prepareStatement(sql);
					pstmt3.setString(1, mddto.getBrand_id());
					rs3 = pstmt3.executeQuery();
					if(rs3.next()){
						BrandDTO bdto = new BrandDTO();
						bdto.setBrand_logo(rs3.getString("brand_logo"));
						bdto.setBrand_name(rs3.getString("brand_name"));
						brandInfoList.add(bdto);
					}
				}
			}
			vec.add(memberDrawList);
			vec.add(sneakerInfoList);
			vec.add(brandInfoList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return vec;
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
			
			sql = "insert into shoeinfo_member(count, email, email_BySHA, pass, name, phone, reg_date, position, salt_id, salt) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, mdto.getEmail());
			pstmt.setString(3, mdto.getEmail_BySHA());
			pstmt.setString(4, mdto.getPass());
			pstmt.setString(5, mdto.getName());
			pstmt.setString(6, mdto.getPhone());
			pstmt.setTimestamp(7, mdto.getReg_date());
			pstmt.setString(8, "user");
			pstmt.setString(9, mdto.getSalt_id());
			pstmt.setString(10, mdto.getSalt());
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
	
	//이메일에 해당하는 salt_id 값 가져오는 함수
	public String getSalt_idByEmail(String email){
		String salt_id = "";
		try {
			con = getConnection();
			sql = "select salt_id from shoeinfo_member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()){
				salt_id = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return salt_id;
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
	
	//암호화된 이메일로 실제 이메일 찾는 함수
	public String findEmailbySHA(String email_BySHA) {
		String email = "";
		try {
			con = getConnection();
			sql = "select email from shoeinfo_member where email_BySHA = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_BySHA);
			rs = pstmt.executeQuery();
			if(rs.next()){
				email = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return email;
	}
	
	//회원 비밀번호 재설정 하는 함수
	public int changePass(String email, String pass, String salt){
		int check = -1; 
		try {
			con = getConnection();
			sql = "select email from shoeinfo_member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sql = "update shoeinfo_member set pass = ?, salt = ? where email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pass);
				pstmt.setString(2, salt);
				pstmt.setString(3, email);
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
			sql = "insert into shoeinfo_memberdrawinfo values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userDraw_num);
			pstmt.setString(2, mddto.getMember_email());
			pstmt.setInt(3, mddto.getModel_num());
			pstmt.setString(4, mddto.getModel_stylecode());
			pstmt.setString(5, mddto.getCountry_name());
			pstmt.setString(6, mddto.getBrand_id());
			pstmt.setInt(7, userDraw_count);
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
			sql = "delete from shoeinfo_memberdrawinfo where member_email = ? AND model_num = ? AND model_stylecode = ? AND brand_id = ? AND country_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mddto.getMember_email());
			pstmt.setInt(2, mddto.getModel_num());
			pstmt.setString(3, mddto.getModel_stylecode());
			pstmt.setString(4, mddto.getBrand_id());
			pstmt.setString(5, mddto.getCountry_name());
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
			sql = "select distinct A.model_stylecode, B.num from shoeinfo_memberdrawinfo AS A JOIN shoeinfo_sneakerlibrary AS B ON A.model_stylecode = B.model_stylecode where member_email = ? order by (B.release_date);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberDrawDTO mddto = new MemberDrawDTO();
				mddto.setModel_stylecode(rs.getString("model_stylecode"));
				mddto.setModel_num(rs.getInt("num"));
				
				//해당 브랜드 정보 가져오기
				sql = "select * from shoeinfo_sneakerlibrary where model_stylecode = ? and num = ?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, mddto.getModel_stylecode());
				pstmt2.setInt(2, mddto.getModel_num());
				rs2 = pstmt2.executeQuery();
				
				if(rs2.next()){
					//가지고온 스니커 정보중에 release_date에 date가 포함되어있으면 list에 추가하기
					if(rs2.getString("release_date").contains(date)){
						userDrawStylecodeList.add(mddto);
						//스니커 정보 DB에 해당 스니커가 저장되어있으면
						SneakerDTO sdto = new SneakerDTO();
						sdto.setNum(rs2.getInt("num"));
						sdto.setBrand(rs2.getString("brand"));
						sdto.setModel_name(rs2.getString("model_name"));
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
	
	//사용자가 응모한 브랜드 정보 불러오는 함수
	public Vector getDrawInfo(int model_num, String model_stylecode, String email, String country) {
		Vector vec = new Vector();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt3 = null;
		ResultSet rs3 = null;
		
		PreparedStatement pstmt4 = null;
		ResultSet rs4 = null;
		
		//대한민국 신발 응모 정보 저장
		//브랜드 정보 저장
		ArrayList drawInfoList_kr = new ArrayList();
		ArrayList brandList_kr = new ArrayList();
		ArrayList onlineinfoList_kr = new ArrayList();
		
		try {	
			con = getConnection();
			if(country.equals("대한민국")){
				sql = "select * from shoeinfo_memberdrawinfo where model_num = ? AND model_stylecode = ? AND member_email = ? AND country_name = ?";
			}else if(country.equals("해외")){
				sql = "select * from shoeinfo_memberdrawinfo where model_num = ? AND model_stylecode = ? AND member_email = ? AND not country_name = ? order by draw_count";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, model_num);
			pstmt.setString(2, model_stylecode);
			pstmt.setString(3, email);
			pstmt.setString(4, "대한민국");
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDrawDTO mddto = new MemberDrawDTO();
				mddto.setBrand_id(rs.getString("brand_id"));
				mddto.setModel_stylecode(rs.getString("model_stylecode"));
				mddto.setModel_num(rs.getInt("model_num"));
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
						brandList_kr.add(bdto);
					
						//발매링크 가져오기
						sql="select * from shoeinfo_onlineinfo where model_stylecode = ? and brand_id = ?";
						pstmt4 = con.prepareStatement(sql);
						pstmt4.setString(1, model_stylecode);
						pstmt4.setString(2, mddto.getBrand_id());
						rs4 = pstmt4.executeQuery();
						if(rs4.next()){
							OnlineDTO odto = new OnlineDTO();
							odto.setOnline_link(rs4.getString("online_link"));
							odto.setBuy_method(rs4.getString("buy_method"));
							onlineinfoList_kr.add(odto);
						}
					}
				}
			}
			vec.add(drawInfoList_kr);
			vec.add(brandList_kr);
			vec.add(onlineinfoList_kr);
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
	public int requestBrand(String brandName, String brandURL, String user){
		int check = -1;
		int num = 0;
		try {
			con = getConnection();
			//중복 브랜드 체크
			sql = "select * from shoeinfo_memberBrandReq where req_brandName = ? and req_member = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, brandName);
			pstmt.setString(2, user);
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = 0;
			}else {
				sql = "select max(req_num) from shoeinfo_memberBrandReq";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					num = rs.getInt(1) + 1;
				}
				sql = "insert into shoeinfo_memberBrandReq values(?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, brandName);
				pstmt.setString(3, brandURL);
				pstmt.setString(4, "false");
				pstmt.setString(5, user);
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
	
	//계정 삭제하는 함수
	public int deleteMemberInfo(String email){
		int check = -1;
		try {
			con = getConnection();
			
			sql = "delete from shoeinfo_member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			
			sql = "delete from shoeinfo_memberdrawinfo where member_email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			
			sql = "delete from shoeinfo_memberBrandReq where req_member = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			
			sql = "delete from shoeinfo_onlineinfo where online_writer = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			check = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	
	
}