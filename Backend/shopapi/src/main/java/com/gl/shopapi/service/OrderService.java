package com.gl.shopapi.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.gl.shopapi.entity.OrderMain;

public interface OrderService {
	Page<OrderMain> findAll(Pageable pageable);

	Page<OrderMain> findByStatus(Integer status, Pageable pageable);

	Page<OrderMain> findByBuyerEmail(String email, Pageable pageable);

	Page<OrderMain> findByBuyerPhone(String phone, Pageable pageable);

	OrderMain findOne(Long orderId);

	OrderMain finish(Long orderId);

	OrderMain cancel(Long orderId);

}
