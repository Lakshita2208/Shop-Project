package com.gl.shopapi.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.gl.shopapi.entity.OrderMain;
import com.gl.shopapi.entity.User;
import com.gl.shopapi.entity.WishList;
import com.gl.shopapi.repository.WishListCustomRepository;
import com.gl.shopapi.repository.WishListRepository;

@Service
@Transactional
public class WishListService {

	private final WishListRepository wishListRepository;

	@Autowired
	private WishListCustomRepository wishListCustomRepository;

	public WishListService(WishListRepository wishListRepository) {
		this.wishListRepository = wishListRepository;
	}

	public WishList createWishlist(WishList wishList) {
		return wishListRepository.save(wishList);
	}

	public List<WishList> readWishList(Long userId) {
		return null;

	}

	public Boolean deleteWishlist(User user, String productId) {
		return wishListCustomRepository.deleteWishlist(user, productId);
	}

	public Page<WishList> findByBuyerEmail(Long id, PageRequest request) {
		return wishListRepository.findAllByUserId(id, request);
	}
}
