package com.gl.shopapi.vo.response;

import java.util.List;

import com.gl.shopapi.entity.User;

public class UserListResponse {

	private List<User> userList;

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

}
