package com.gl.shopapi.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import com.gl.shopapi.entity.Cart;
import com.gl.shopapi.entity.ProductInOrder;
import com.gl.shopapi.entity.User;
import com.gl.shopapi.form.ItemForm;
import com.gl.shopapi.repository.ProductInOrderRepository;
import com.gl.shopapi.service.CartService;
import com.gl.shopapi.service.ProductInOrderService;
import com.gl.shopapi.service.ProductService;
import com.gl.shopapi.service.UserService;

import java.security.Principal;
import java.util.Collection;
import java.util.Collections;

@CrossOrigin
@RestController
@RequestMapping("/cart")
public class CartController {
	@Autowired
	CartService cartService;
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	@Autowired
	ProductInOrderService productInOrderService;
	@Autowired
	ProductInOrderRepository productInOrderRepository;

	@PostMapping("")
	public ResponseEntity<Cart> mergeCart(@RequestBody Collection<ProductInOrder> productInOrders,
			Principal principal) {
		User user = userService.findOne(principal.getName());
		try {
			cartService.mergeLocalCart(productInOrders, user);
		} catch (Exception e) {
			ResponseEntity.badRequest().body("Merge Cart Failed");
		}
		return ResponseEntity.ok(cartService.getCart(user));
	}

	@GetMapping("")
	public Cart getCart(Principal principal) {
		User user = userService.findOne(principal.getName());
		return cartService.getCart(user);
	}

	@PostMapping("/add")
	public boolean addToCart(@RequestBody ItemForm form, Principal principal) {
		var productInfo = productService.findOne(form.getProductId());
		try {
			mergeCart(Collections.singleton(new ProductInOrder(productInfo, form.getQuantity())), principal);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	@PutMapping("/{itemId}")
	public ProductInOrder modifyItem(@PathVariable("itemId") String itemId, @RequestBody Integer quantity,
			Principal principal) {
		User user = userService.findOne(principal.getName());
		productInOrderService.update(itemId, quantity, user);
		return productInOrderService.findOne(itemId, user);
	}

	@DeleteMapping("/{itemId}")
	public void deleteItem(@PathVariable("itemId") String itemId, Principal principal) {
		User user = userService.findOne(principal.getName());
		cartService.delete(itemId, user); // Delete memory into DB
	}

	@PostMapping("/checkout")
	public ResponseEntity checkout(Principal principal) {
		User user = userService.findOne(principal.getName());
		cartService.checkout(user);
		return ResponseEntity.ok(null);
	}

}
