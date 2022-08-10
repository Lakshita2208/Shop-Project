package com.gl.shopapi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gl.shopapi.entity.OrderMain;
import com.gl.shopapi.entity.ProductInOrder;
import com.gl.shopapi.entity.ProductInfo;
import com.gl.shopapi.enums.OrderStatusEnum;
import com.gl.shopapi.enums.ResultEnum;
import com.gl.shopapi.exception.MyException;
import com.gl.shopapi.repository.OrderRepository;
import com.gl.shopapi.repository.ProductInOrderRepository;
import com.gl.shopapi.repository.ProductInfoRepository;
import com.gl.shopapi.repository.UserRepository;
import com.gl.shopapi.service.OrderService;
import com.gl.shopapi.service.ProductService;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderRepository orderRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	ProductInfoRepository productInfoRepository;
	@Autowired
	ProductService productService;
	@Autowired
	ProductInOrderRepository productInOrderRepository;

	@Override
	public Page<OrderMain> findAll(Pageable pageable) {
		return orderRepository.findAllByOrderByOrderStatusAscCreateTimeDesc(pageable);
	}

	@Override
	public Page<OrderMain> findByStatus(Integer status, Pageable pageable) {
		return orderRepository.findAllByOrderStatusOrderByCreateTimeDesc(status, pageable);
	}

	@Override
	public Page<OrderMain> findByBuyerEmail(String email, Pageable pageable) {
		return orderRepository.findAllByBuyerEmailOrderByOrderStatusAscCreateTimeDesc(email, pageable);
	}

	@Override
	public Page<OrderMain> findByBuyerPhone(String phone, Pageable pageable) {
		return orderRepository.findAllByBuyerPhoneOrderByOrderStatusAscCreateTimeDesc(phone, pageable);
	}

	@Override
	public OrderMain findOne(Long orderId) {
		OrderMain orderMain = orderRepository.findByOrderId(orderId);
		if (orderMain == null) {
			throw new MyException(ResultEnum.ORDER_NOT_FOUND);
		}
		return orderMain;
	}

	@Override
	@Transactional
	public OrderMain finish(Long orderId) {
		OrderMain orderMain = findOne(orderId);
		if (!orderMain.getOrderStatus().equals(OrderStatusEnum.NEW.getCode())) {
			throw new MyException(ResultEnum.ORDER_STATUS_ERROR);
		}

		orderMain.setOrderStatus(OrderStatusEnum.FINISHED.getCode());
		orderRepository.save(orderMain);
		return orderRepository.findByOrderId(orderId);
	}

	@Override
	@Transactional
	public OrderMain cancel(Long orderId) {
		OrderMain orderMain = findOne(orderId);
		if (!orderMain.getOrderStatus().equals(OrderStatusEnum.NEW.getCode())) {
			throw new MyException(ResultEnum.ORDER_STATUS_ERROR);
		}

		orderMain.setOrderStatus(OrderStatusEnum.CANCELED.getCode());
		orderRepository.save(orderMain);

		Iterable<ProductInOrder> products = orderMain.getProducts();
		for (ProductInOrder productInOrder : products) {
			ProductInfo productInfo = productInfoRepository.findByProductId(productInOrder.getProductId());
			if (productInfo != null) {
				productService.increaseStock(productInOrder.getProductId(), productInOrder.getCount());
			}
		}
		return orderRepository.findByOrderId(orderId);

	}
}
