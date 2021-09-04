package com.HuynhTrongNghia_Mini_project.service;

import java.util.List;

import com.HuynhTrongNghia_Mini_project.entity.Account;


public interface AccountService {
	
	public Account findById(String username);

	public List<Account> getAdministrators();

	public List<Account> findAll();

	public Account create(Account account);

	public Account update(Account account);

	void delete(String username);

	List<Account> timTheoTen(String username);
	
	


}
