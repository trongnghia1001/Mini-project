package com.HuynhTrongNghia_Mini_project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import com.HuynhTrongNghia_Mini_project.DAO.CategoryDAO;
import com.HuynhTrongNghia_Mini_project.entity.Category;
import com.HuynhTrongNghia_Mini_project.service.CategoryService;



@Configuration
public class CategoryServicelmpl implements CategoryService {
	@Autowired
	CategoryDAO cdao;

	@Override
	public List<Category> findAll() {
		return cdao.findAll();
	}
}
