package com.HuynhTrongNghia_Mini_project.DAO;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.HuynhTrongNghia_Mini_project.entity.Product;




public interface ProductDAO extends JpaRepository<Product, Integer>{

	@Query("SELECT p FROM Product p WHERE p.category.id=?1 and p.available=true")
	List<Product> findByCategoryId(String cid);
	
	@Query("SELECT a FROM Product a WHERE a.name LIKE ?1 ")
	List<Product> timTheoTen(String name);
	
	@Query("SELECT a FROM Product a WHERE a.price=?1 ")
	List<Product> timTheogGia(Double price);
	
	@Query("SELECT p FROM Product p WHERE p.available=true")
	Page<Product> findAvailable(Pageable pa);
}
