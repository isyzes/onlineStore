package com.store.model.product;


import com.store.model.user.User;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;
import java.util.TreeSet;

@Getter
@Setter
@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue (strategy = GenerationType.SEQUENCE)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "brand")
    private String brand;

    @Column(name = "price")
    private double price;

    @ElementCollection(targetClass = Size.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "product_size", joinColumns = @JoinColumn(name = "product_id"))
    @Enumerated(EnumType.STRING)
    private Set<Size> size;

    @Column(name = "special_offers")
    private boolean specialOffers;

    @Column(name = "new_arrivals")
    private boolean newArrivals;

    @Column(name = "categories")
    @Enumerated(EnumType.STRING)
    private Categories categories;

    @Column(name = "section")
    private String section;

    @ElementCollection(targetClass = Colour.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "product_colour", joinColumns = @JoinColumn(name = "product_id"))
    @Enumerated(EnumType.STRING)
    private Set<Colour> colour;

    @Column(name = "details", length = 600)
    private String details; // 600 символов

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "products_related",
            joinColumns = {@JoinColumn(name = "product_id")},
            inverseJoinColumns = {@JoinColumn(name = "related_product_id")}
    )
    private Set<Product> relatedProducts; //сопутствующие товара

    @Column(name = "main_photo")
    private String mainPhoto;

    @Column(name = "avatar_photo")
    private String avatarPhoto;

    @ElementCollection(targetClass = String.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "product_photo", joinColumns = @JoinColumn(name = "product_id"))
    private Set<String> photos;

    @Column(name = "rating")
    private Long rating;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public void upRating() {
        if (rating == null) {
            rating = 0L;
        }
        rating++;
    }

    public Set<Size> getSize() {
        return new TreeSet<>(size);
    }
}