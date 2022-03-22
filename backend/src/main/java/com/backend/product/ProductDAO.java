package com.backend.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ProductDTO;

// ibatis 이전이름 - Mybatis 변경
@Repository("prodcutdao")
public class ProductDAO{
	
	@Autowired
	SqlSession session;

	//저장
	public int insertprodct(ProductDTO dto) {
		int insertrow = session.insert("insertproduct", dto);
		return insertrow;
	}

	//수정
	public int updateproduct(ProductDTO dto) {
		return session.update("updatproduct", dto);//id, name, address
	}

	//삭제
	public int deleteproduct(String id) {
		return session.delete("deleteproduct", id);
		
	}
	
	public List<ProductDTO> memberlist(){
		List<ProductDTO> list = session.selectList("prodcutlist");
		return list;
	}
	
	public List<ProductDTO> productlist(int page){
		int [] limit = new int[] { (page-1)*5 , 5};
		List<ProductDTO> list = session.selectList("paginglist", limit);//<select id="??">
		return list;
	}	
	
	public List<String> productlist(String[] address){
		List<String> list = session.selectList("addresssearch", address);//<select id="??">
		return list;
	}
	public ProductDTO product(String id) {
		ProductDTO dto = session.selectOne("member", id);
		return dto;
	}
}



