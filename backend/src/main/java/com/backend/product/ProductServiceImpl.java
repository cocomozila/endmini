package com.backend.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dto.ProductDTO;

@Service("productservice")
public class ProductServiceImpl implements ProductService{
	@Autowired
	@Qualifier("productdao")
	ProductDAO dao;
	@Override
	public int insertprodct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteproduct(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductDTO> productlist() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductDTO> prodcutlist(int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> prodcutlist(String[] address) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductDTO product(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
