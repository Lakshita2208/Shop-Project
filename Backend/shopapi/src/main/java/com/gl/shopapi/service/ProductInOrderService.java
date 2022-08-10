package com.gl.shopapi.service;

import com.gl.shopapi.entity.ProductInOrder;
import com.gl.shopapi.entity.User;

public interface ProductInOrderService {
	void update(String itemId, Integer quantity, User user);

	ProductInOrder findOne(String itemId, User user);
}
