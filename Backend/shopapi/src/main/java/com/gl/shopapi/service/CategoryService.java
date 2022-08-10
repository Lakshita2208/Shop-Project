package com.gl.shopapi.service;

import java.util.List;

import com.gl.shopapi.entity.ProductCategory;

public interface CategoryService {

	List<ProductCategory> findAll();

	ProductCategory findByCategoryType(Integer categoryType);

	List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList);

	ProductCategory save(ProductCategory productCategory);

}
