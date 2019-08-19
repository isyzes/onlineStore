package com.store.repository;

import com.store.model.store.Order;
import com.store.model.store.ProductItem;
import com.store.model.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface OrderRepository extends JpaRepository<Order, Long> {
    Order findById(long id);
    List<Order> findByProduct(ProductItem product);

    void deleteAllByUsers(Set<User> users);

}
