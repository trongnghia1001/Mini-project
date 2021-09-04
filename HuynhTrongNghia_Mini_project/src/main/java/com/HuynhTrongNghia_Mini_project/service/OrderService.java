package com.HuynhTrongNghia_Mini_project.service;

import java.util.List;

import com.HuynhTrongNghia_Mini_project.entity.Order;
import com.fasterxml.jackson.databind.JsonNode;

public interface OrderService {

	Order create(JsonNode orderData);

	Order findById(Long id);

	List<Order> findByUsername(String username);



}
