package com.backend.product;

import java.util.List;

import dto.ProductDTO;

public interface ProductService {
	public int insertprodct(ProductDTO dto);
	public int upateproduct(ProductDTO dto);
	public int deleteproduct(String id);
	
	public List<ProductDTO> productlist();
	public List<ProductDTO> prodcutlist(int page);	
	public List<String> prodcutlist(String[] address);	
	public ProductDTO product(String id);
	
	
}
