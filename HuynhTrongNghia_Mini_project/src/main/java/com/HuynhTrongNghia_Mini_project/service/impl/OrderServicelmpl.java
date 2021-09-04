package com.HuynhTrongNghia_Mini_project.service.impl;

import java.util.List;
import java.util.stream.Collectors;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.HuynhTrongNghia_Mini_project.DAO.OrderDAO;
import com.HuynhTrongNghia_Mini_project.DAO.OrderDetailsDAO;
import com.HuynhTrongNghia_Mini_project.entity.Order;
import com.HuynhTrongNghia_Mini_project.entity.OrderDetail;
import com.HuynhTrongNghia_Mini_project.service.OrderService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;



@Service
public class OrderServicelmpl implements OrderService{
	@Autowired
	OrderDAO dao;
	
	@Autowired
	OrderDetailsDAO ddao;

	@Override
	public Order create(JsonNode orderData) {
		ObjectMapper mapper = new ObjectMapper();
		
		Order order = mapper.convertValue(orderData, Order.class);
		dao.save(order);
		
		TypeReference<List<OrderDetail>> type = new TypeReference<List<OrderDetail>>() {};
		List<OrderDetail> details= mapper.convertValue(orderData.get("orderDetails"),type)
				.stream().peek(d -> d.setOrder(order)).collect(Collectors.toList());
		ddao.saveAll(details);
		
		return order;
	}

	@Override
	public Order findById(Long id) {
		return dao.findById(id).get();
	}

	@Override
	public List<Order> findByUsername(String username) {	
		return dao.findByUsername(username);
	}
}
