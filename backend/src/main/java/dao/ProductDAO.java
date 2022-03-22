package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import dto.ProductDTO;

@Repository
public class ProductDAO {

	@Autowired
	SqlSession session;
	
	public List<ProductDTO> searchProduct(String tag) {
		
		List<ProductDTO> list = session.selectList("productlist", tag);
		return list;
	}
}
