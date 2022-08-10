package com.gl.shopapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gl.shopapi.entity.ProductInOrder;

public interface ProductInOrderRepository extends JpaRepository<ProductInOrder, Long> {

}
