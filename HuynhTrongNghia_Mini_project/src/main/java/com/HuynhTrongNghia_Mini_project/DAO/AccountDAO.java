package com.HuynhTrongNghia_Mini_project.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.HuynhTrongNghia_Mini_project.entity.Account;




public interface AccountDAO extends JpaRepository<Account, String> {
	@Query("SELECT DISTINCT ar.account FROM Authority ar WHERE ar.role.id IN ('DIRE','STAF')")
	List<Account> getAdministrators();

	@Query("SELECT a FROM Account a WHERE a.username LIKE ?1 ")
	List<Account> timTheoTen(String username);
}
