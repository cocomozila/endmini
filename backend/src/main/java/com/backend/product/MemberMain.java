package com.backend.product;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dto.ProductDTO;


public class MemberMain {

	public static void main(String[] args) throws IOException{
		ApplicationContext factory = new ClassPathXmlApplicationContext
				("spring/mybatis/spring-mybatis.xml");
		
		//전체 회원 조회
		ProductService service = (ProductService)factory.getBean("productservice");
		List<ProductDTO> list = service.productlist();
		for(ProductDTO dto : list) {
			System.out.println(dto.getProductName() + ":" + dto.getProductEName());
		}
		//저장
/*		MemberDTO dto = new MemberDTO();
		dto.setId("mybatis2");
		dto.setPassword("mybatis2");
		dto.setName("홍길동");
		dto.setPhone("019-0000-9999");
		dto.setEmail("mybatis2@a.com");
		dto.setAddress("제주도 서귀포시");
		int insertrow = service.insertmember(dto);
		System.out.println(insertrow);
*/		
		//수정
/*		MemberDTO dto = new MemberDTO();
		dto.setId("mybatis2");
		dto.setName("이수정");
		dto.setAddress("대전시");
		int updaterow = service.upatemember(dto);//id, name, address
		System.out.println(updaterow );
*/		
		
		//삭제
/*	service.deletemember("mybatis2");
*/
		
		//전체 회원 조회
/*		List<MemberDTO> list = session.selectList("memberlist") ; 
		for(MemberDTO dto2 : list) {
			System.out.println(dto2.getId()+":"+dto2.getName()+":"+dto2.getAddress());
		}
*/		
		//1개 레코드 조회
/*		MemberDTO onedto = session.selectOne("member", "mybatis");
		System.out.println(onedto.getId()+":"+onedto.getName()+":"+onedto.getAddress());
*/		
		//페이징처리조회
/*		int [] limit = {5, 6};
		List<MemberDTO> list = session.selectList("paginglist", limit);
		for(MemberDTO pagingdto : list) {
			System.out.println(pagingdto.getId()+":"+pagingdto.getName()+":"+pagingdto.getAddress());			
		}
*/		
		//조건검색조회
/*		String address[] = {"서울","제주"};
		List<String> list = session.selectList("addresssearch", address);//id컬럼만(1개레코드)
		for(String s : list) {
			System.out.println(s);			
		}		
*/
	}//main

}//class





