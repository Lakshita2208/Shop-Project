package com.gl.shopapi.vo.response;

import java.util.List;

import com.gl.shopapi.entity.ProductInfo;

public class ProductInfoResponse {

	private List<ProductInfo> productList;

	public List<ProductInfo> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductInfo> productList) {
		this.productList = productList;
	}

}
