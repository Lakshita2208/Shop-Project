package com.gl.shopapi.service;

import java.util.Collection;

import com.gl.shopapi.entity.Cart;
import com.gl.shopapi.entity.ProductInOrder;
import com.gl.shopapi.entity.User;

public interface CartService {
	Cart getCart(User user);

	void mergeLocalCart(Collection<ProductInOrder> productInOrders, User user);

	void delete(String itemId, User user);

	void checkout(User user);
}
