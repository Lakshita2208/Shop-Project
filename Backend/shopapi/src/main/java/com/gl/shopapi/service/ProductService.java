package com.gl.shopapi.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.gl.shopapi.entity.ProductInfo;

public interface ProductService {

	ProductInfo findOne(String productId);

	Page<ProductInfo> findUpAll(Pageable pageable);

	Page<ProductInfo> findAll(Pageable pageable);

	Page<ProductInfo> findAllInCategory(Integer categoryType, Pageable pageable);

	void increaseStock(String productId, int amount);

	void decreaseStock(String productId, int amount);

	ProductInfo offSale(String productId);

	ProductInfo onSale(String productId);

	ProductInfo update(ProductInfo productInfo);

	ProductInfo save(ProductInfo productInfo);

	void delete(String productId);

	List<ProductInfo> findAll();

}
