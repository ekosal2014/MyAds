package myads.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myads.model.dto.Image;
import myads.model.dto.PostingDto;
import myads.model.dto.PostingListDto;
import myads.model.dto.SubCategoryDto;
import myads.model.sqlConnection.SqlConnection;

public class PostingDao {
	DataSource ds;
	Connection con;
	static PreparedStatement ps;
	PreparedStatement psimg;
	static ResultSet rs;
	
	public PostingDao(){
		System.out.println("New!!!!!!!!!!1");
		try{
			Context init = new InitialContext();
	  	    ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	  		System.out.println("Connection New!!!!!!!!!!1");
		}catch(Exception ex){
			System.out.println("DB Connection Failture! : " + ex);
			return;
		}	
	}
	
	// insert main category
	public boolean insertPosting(PostingDto dto) throws SQLException{
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyy");
		
		String sql = "insert into tbl_posting values(?,?,?,?,?,?,?,?,?,?,?,?)";
		String sqlimage="insert into tbl_image values(?,?,?,?)";
		try{
			SqlConnection.getConnection().setAutoCommit(false);
			ps =SqlConnection.getConnection().prepareStatement(sql);
			psimg =SqlConnection.getConnection().prepareStatement(sqlimage);
			ps.setInt(1, dto.getPostingId());
			ps.setInt(2, dto.getMemId());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getKey());
			ps.setInt(5, dto.getSubCateId());
			ps.setInt(6, dto.getPrice());
			ps.setString(7, dto.getPhone());
			ps.setString(8, dto.getAdr());
			ps.setString(9, dto.getDsc());
			ps.setInt(10, dto.getActive());
			ps.setString(11,sdf.format(dt));
			ps.setString(12, dto.getDiscount());
			ps.executeUpdate();
			
			for(int i=0;i<dto.getPhoto().size();i++){
				psimg.setInt(1, dto.getPhoto().get(i).getImage_id());
				psimg.setInt(2, dto.getPhoto().get(i).getPost_id());
				psimg.setString(3, dto.getPhoto().get(i).getImage());
				psimg.setInt(4, dto.getPhoto().get(i).getOrder());
				psimg.executeUpdate();
			}
			
			SqlConnection.getConnection().commit();
			
			return true;
		}catch(SQLException e){
			System.err.println("SQL Error : insert"+ e);
			return false;
		}
	}
	
	///   list posting
	
	public List<PostingListDto> getPostingList(){
		ResultSet rs=null;
		String sql="select p.PostingId,p.MemId,p.ProductName,p.Price,p.Phone,"+
		"p.Address,p.Description,p.Discount ,i.Image,sc.Name from tbl_posting p INNER JOIN tbl_image i "+
		"on p.PostingId=i.PostingId INNER JOIN tbl_sub_category sc "+
		"on p.SubCateId=sc.SubCateId where i.order=1 GROUP BY p.PostingId ORDER BY p.PostDate DESC";
 
		List<PostingListDto> postinglist=new ArrayList<>();
		
		try {
			
			ps=SqlConnection.getConnection().prepareStatement(sql);
			rs=ps.executeQuery();
		    while(rs.next()){
		    	
		    	PostingListDto posintdto=new PostingListDto();
		    	posintdto.setPostingId(rs.getInt("PostingId"));
		    	posintdto.setMemId(rs.getInt("MemId"));
		    	posintdto.setProductName(rs.getString("ProductName"));
		    	posintdto.setPrice(rs.getInt("Price"));
		    	posintdto.setPhone(rs.getString("Phone"));
		    	posintdto.setAdr(rs.getString("Address"));
		    	posintdto.setDsc(rs.getString("Description"));
		    	posintdto.setDiscount(rs.getString("Discount"));
		    	posintdto.setImg(rs.getString("Image"));
		    	posintdto.setSubCateName(rs.getString("Name"));
		    	postinglist.add(posintdto);
		    }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			postinglist=null;
		}
		return postinglist;
	}
	
	
	public List<PostingDto> readProductByCategory(String category_id){
		List<PostingDto> productList=new ArrayList<>();
		try{			
			String sql="select i.Image,p.PostingId,p.ProductName,p.Price,p.Discount,p.KeyNotice from tbl_posting "
					+ "p INNER JOIN tbl_sub_category sc on p.SubCateId=sc.SubCateId "
					+ "INNER JOIN tbl_category c on c.CateId=sc.CateId INNER JOIN tbl_image "
					+ "i on p.PostingId=i.PostingId WHERE c.CateId=? and p.Active=1 and i.order=1";
			
			ps=ds.getConnection().prepareStatement(sql);
			ps.setInt(1,Integer.valueOf(category_id));
			rs=ps.executeQuery();
			while(rs.next()){
				PostingDto posting=new PostingDto();
				Image image=new Image();
				image.setImage(rs.getString("Image"));
				posting.setTitle(rs.getString("ProductName"));
				posting.setKey(rs.getString("KeyNotice"));
				posting.setPostingId(rs.getInt("PostingId"));
				posting.setPrice(rs.getInt("Price"));
				posting.setDiscount(rs.getString("Discount"));
				posting.setImage(image);
				productList.add(posting);
			}
			return productList;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public List<PostingDto> readProductByCategoryAndSubCategory(String category_id,String subCategoryId){
		List<PostingDto> productList=new ArrayList<>();
		try{
			String sql="select i.Image,p.PostingId,p.ProductName,p.Price,p.Discount,p.KeyNotice from tbl_posting "
					+ "p INNER JOIN tbl_sub_category sc on p.SubCateId=sc.SubCateId "
					+ "INNER JOIN tbl_category c on c.CateId=sc.CateId INNER JOIN tbl_image "
					+ "i on p.PostingId=i.PostingId WHERE c.CateId=? and p.Active=1 and i.order=1 and sc.CateId=?";
			ps=ds.getConnection().prepareStatement(sql);
			ps.setInt(1,Integer.valueOf(category_id));
			ps.setInt(2,Integer.valueOf(subCategoryId));
			rs=ps.executeQuery();
			while(rs.next()){
				PostingDto posting=new PostingDto();
				Image image=new Image();
				image.setImage(rs.getString("Image"));
				posting.setTitle(rs.getString("ProductName"));
				posting.setPostingId(rs.getInt("PostingId"));
				posting.setPrice(rs.getInt("Price"));
				posting.setKey(rs.getString("KeyNotice"));
				posting.setDiscount(rs.getString("Discount"));
				posting.setImage(image);
				productList.add(posting);
			}
			return productList;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	

}
