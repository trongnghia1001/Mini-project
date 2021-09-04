package com.HuynhTrongNghia_Mini_project.service;

import java.util.List;

import com.HuynhTrongNghia_Mini_project.entity.Authority;



public interface AuthorityService {
	public List<Authority> findAll();
	public Authority create(Authority auth);
	
	public void delete(Integer id);
	public List<Authority> findAuthoritiesOfAdministrators();
}	
