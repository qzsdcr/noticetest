package notice.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import notice.db.DBCon;
import notice.vo.Notice;

public class NoticeDao {
	
	public void insert(Notice notice)throws Exception{
		Connection conn=null;
		PreparedStatement pstmt = null;


		try {
			conn = DBCon.getConnection();

			//인서트 작업

			String sql = "insert into notices values((select max(to_number(seq))+1 from notices),?,'jay_l',?,systimestamp,0)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());

			//실행
			int result = pstmt.executeUpdate();
			System.out.println("result : " + result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)try { pstmt.close();} catch (Exception e) {}
		}
		

		
		
	}
	public List<Notice> getList() throws Exception{
		Connection conn=DBCon.getConnection();
    	String sql="select * from notices order by to_number(seq) desc";
    	
    	Statement st=conn.createStatement();
    	ResultSet rs=st.executeQuery(sql);
    	
    	//리스트를 담아
    	List<Notice> list=new ArrayList<Notice>();
    	while (rs.next()) {
    		Notice n= new Notice();
    		n.setSeq(rs.getString("seq"));
    		n.setTitle(rs.getString("title"));
    		n.setWriter(rs.getString("writer"));
    		n.setContent(rs.getString("content"));
    		n.setRegdate(rs.getDate("regdate"));
    		n.setHit(rs.getInt("hit"));
    		
    		
    		list.add(n);
    		
    	}
    	return list;
	}
	
	
	
	
	public int delete(String num)throws Exception{
		 
			Connection conn=DBCon.getConnection();
			
			String sql="delete from notices where seq=?";
			PreparedStatement pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, num);

			int cnt=pstmt.executeUpdate();
			return cnt;
		
		
		
	}
	
	
	
	
	public int update(Notice notice) throws Exception {

			Connection conn=DBCon.getConnection();
			
			String sql="update notices set title=?, content=?  where seq=?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getSeq());

			int cnt=pstmt.executeUpdate();
			return cnt;
	}
	
	public Notice getNoice(String num) throws Exception {//예외처리 꼭 해야댐

		Connection conn=DBCon.getConnection();
		
		
		String sql="select * from notices where seq=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, num);

		ResultSet rs=pstmt.executeQuery();
		
		rs.next();
		//notice.java 파일에 저장 setting
		Notice n=new Notice();
		n.setSeq(rs.getString("seq"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		rs.close();
		pstmt.close();
		conn.close();
		return n;
		
	
	}
	

}
