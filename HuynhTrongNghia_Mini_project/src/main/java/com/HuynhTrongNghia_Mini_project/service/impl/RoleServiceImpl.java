package com.HuynhTrongNghia_Mini_project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.HuynhTrongNghia_Mini_project.DAO.RoleDAO;
import com.HuynhTrongNghia_Mini_project.entity.Role;
import com.HuynhTrongNghia_Mini_project.service.RoleService;


@Service
public class RoleServiceImpl implements RoleService{
	@Autowired
	RoleDAO dao;
	
	public List<Role>findAll(){
		return dao.findAll();
	}
}
