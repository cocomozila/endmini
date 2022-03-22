package index;

import java.util.List;
import dto.ProductDTO;

public interface IndexService {

	public List<ProductDTO> search(String tag);
}
