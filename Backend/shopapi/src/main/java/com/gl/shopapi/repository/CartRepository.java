package com.gl.shopapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gl.shopapi.entity.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {
}
