package com.store.model.store;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Objects;

@Setter
@Getter
@Entity
@Table(name = "address")
public class Address {
    @Id
    @GeneratedValue (strategy = GenerationType.SEQUENCE)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "mobile")
    private String mobile;

    @Column(name = "street")
    private String street;

    @Column(name = "apartment")
    private String apartment;

    @Column(name = "country")
    private String country;

    @Column(name = "state")
    private String state;

    @Column(name = "city")
    private String city;

    @Column(name = "zip")
    private String zip;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Address address = (Address) o;
        return Objects.equals(name, address.name) &&
                Objects.equals(mobile, address.mobile) &&
                Objects.equals(street, address.street) &&
                Objects.equals(apartment, address.apartment) &&
                Objects.equals(country, address.country) &&
                Objects.equals(state, address.state) &&
                Objects.equals(city, address.city) &&
                Objects.equals(zip, address.zip);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, mobile, street, apartment, country, state, city, zip);
    }

    @Override
    public String toString() {
        return "Address: \n" +
                "country = '" + country + '\'' + "\n" +
                "state = '" + state + '\'' + "\n" +
                "city = '" + city + '\'' + "\n" +
                "street = '" + street + '\'' + "\n" +
                "apartment = '" + apartment + '\'' + "\n"+
                "zip = '" + zip + '\'' + "\n" +
                "mobile = '" + mobile + '\'';
    }
}
