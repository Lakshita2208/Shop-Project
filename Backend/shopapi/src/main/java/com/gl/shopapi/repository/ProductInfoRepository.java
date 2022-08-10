package com.gl.shopapi.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.gl.shopapi.entity.ProductInfo;

public interface ProductInfoRepository extends JpaRepository<ProductInfo, String> {
	ProductInfo findByProductId(String id);

	Page<ProductInfo> findAllByProductStatusOrderByProductIdAsc(Integer productStatus, Pageable pageable);

	Page<ProductInfo> findAllByCategoryTypeOrderByProductIdAsc(Integer categoryType, Pageable pageable);

	Page<ProductInfo> findAllByOrderByProductId(Pageable pageable);

}
