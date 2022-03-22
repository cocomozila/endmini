package index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.ProductDAO;
import dto.ProductDTO;

@Service
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	ProductDAO dao;

	@Override
	public List<ProductDTO> search(String tag) {
		return dao.searchProduct(tag);
	}

}
