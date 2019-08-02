package com.store.model.user;

import com.store.model.store.Address;
import com.store.model.store.CreditCard;
import com.store.model.store.Order;
import com.store.model.store.Parcel;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.*;

@Setter
@Getter
@Entity
@Table(name = "user")
public class User implements UserDetails {
    @Id
    @GeneratedValue (strategy = GenerationType.SEQUENCE)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email")
    private String email;

    @Column(name = "activation_code")
    private String activationCode;
    @Column(name = "activation_account")
    private Boolean isActivationAccount;

    @Column(name = "password")
    private String password;

    @Column(name = "sex")
    @Enumerated(EnumType.STRING)//нужно для типа Enum
    private Sex sex;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, targetEntity = Order.class)
    private Set<Order> basket = new HashSet<>();//корзина

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, targetEntity = Parcel.class)
    private Set<Parcel> purchases = new HashSet<>(); // покупки

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "addresses_id")
    private Address addresses;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "credit_card_id")
    private CreditCard creditCards;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return isActivationAccount;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public int getItemsBasket() {
        return basket.size();
    }

    public double getPriceBasket() {
        double total = 0;

        for (Order order: basket) {
            total += order.getProduct().getPrice();
        }
        return (double)Math.round(total * 100d) / 100d;
    }

    public int getItemsPurchases() {
        return purchases.size();
    }

}
