package com.store.repository;

import com.store.model.store.Order;
import com.store.model.store.ProductItem;
import com.store.model.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    Order findById(long id);
    List<Order> findByProduct(ProductItem product);

    @Transactional
    void deleteAllByUser(User user);

}
