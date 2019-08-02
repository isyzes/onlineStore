package com.store.model.store;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Entity
@Table(name = "email")
public class Email {
    @Id
    @GeneratedValue (strategy = GenerationType.SEQUENCE)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "email")
    private String email;

    public Email(String email) {
        this.email = email;
    }

    public Email() {
    }
}
