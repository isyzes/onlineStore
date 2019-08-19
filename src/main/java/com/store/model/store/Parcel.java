package com.store.model.store;

import com.store.model.user.User;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Setter
@Getter
@Entity
@Table(name = "parcels")
public class Parcel {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_item_id")
    private ProductItem product;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "address_id")
    private Address address;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "credit_card_id")
    private CreditCard creditCard;

    @ManyToMany(mappedBy = "basket")
    private Set<User> users;
}