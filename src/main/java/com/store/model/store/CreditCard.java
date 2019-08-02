package com.store.model.store;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Objects;

@Setter
@Getter
@Entity
@Table(name = "credit_cards")
public class CreditCard {
    @Id
    @GeneratedValue (strategy = GenerationType.SEQUENCE)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "card_number")
    private String cardNumber;

    @Column(name = "holder")
    private String holder;

    @Column(name = "expires")
    private String expires;

    @Column(name = "cvv")
    private String cvv;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CreditCard that = (CreditCard) o;
        return Objects.equals(cardNumber, that.cardNumber) &&
                Objects.equals(holder, that.holder) &&
                Objects.equals(expires, that.expires) &&
                Objects.equals(cvv, that.cvv);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cardNumber, holder, expires, cvv);
    }
}