package com.store.model.product;

import java.util.List;

public enum Categories {
    WOMEN("Women's Clothing"),
    MEN("Men's Clothing"),
    LUGGAGE_AND_BAGS("Luggage & Bags"),
    SHOES("Shoes"),
    WATCHES("Watches");

    private String name;
    Categories(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }

    public List<String> getListSection() {
        if (this.equals(WOMEN))
            return Section.WOMEN;

        if (this.equals(MEN))
            return Section.MEN;

        if (this.equals(LUGGAGE_AND_BAGS))
            return Section.LUGGAGE_AND_BAGS;

        if (this.equals(SHOES))
            return Section.SHOES;

//        if (this.equals(MOTHER_AND_KIDS))
//            return Section.MOTHER_AND_KIDS;

        if (this.equals(WATCHES))
            return Section.WATCHES;

        return null;
    }
}