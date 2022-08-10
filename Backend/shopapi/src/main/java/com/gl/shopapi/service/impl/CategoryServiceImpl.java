package com.gl.shopapi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gl.shopapi.entity.ProductCategory;
import com.gl.shopapi.enums.ResultEnum;
import com.gl.shopapi.exception.MyException;
import com.gl.shopapi.repository.ProductCategoryRepository;
import com.gl.shopapi.service.CategoryService;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	ProductCategoryRepository productCategoryRepository;

	@Override
	public List<ProductCategory> findAll() {
		List<ProductCategory> res = productCategoryRepository.findAllByOrderByCategoryType();
		return res;
	}

	@Override
	public ProductCategory findByCategoryType(Integer categoryType) {
		ProductCategory res = productCategoryRepository.findByCategoryType(categoryType);
		if (res == null)
			throw new MyException(ResultEnum.CATEGORY_NOT_FOUND);
		return res;
	}

	@Override
	public List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList) {
		List<ProductCategory> res = productCategoryRepository
				.findByCategoryTypeInOrderByCategoryTypeAsc(categoryTypeList);
		return res;
	}

	@Override
	@Transactional
	public ProductCategory save(ProductCategory productCategory) {
		return productCategoryRepository.save(productCategory);
	}

}
