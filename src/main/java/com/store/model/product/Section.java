package com.store.model.product;

import java.util.ArrayList;
import java.util.List;

public class Section {
    public static List<String> WOMEN = new ArrayList<>();
    public static List<String> MEN = new ArrayList<>();
    public static List<String> LUGGAGE_AND_BAGS = new ArrayList<>();
    public static List<String> SHOES = new ArrayList<>();
    public static List<String> MOTHER_AND_KIDS = new ArrayList<>();
    public static List<String> WATCHES = new ArrayList<>();

    //add WOMEN list
    static {
        WOMEN.add("Dresses");
        WOMEN.add("Blouses & Shirts");
        WOMEN.add("Hoodies & Sweatshirts");
        WOMEN.add("Sweaters");
        WOMEN.add("Jackets & Coats");
        WOMEN.add("Bottoms");
        WOMEN.add("Rompers");
        WOMEN.add("Tops & Tees");
        WOMEN.add("Jumpsuits");
        WOMEN.add("Bodysuits");
        WOMEN.add("Suits & Sets");
    }
    //add MEN list
    static {
        MEN.add("Hoodies & Sweatshirts");
        MEN.add("Tops & Tees");
        MEN.add("Jackets & Coats");
        MEN.add("Pants");
        MEN.add("Shirts");
        MEN.add("Jeans");
        MEN.add("Sweaters");
        MEN.add("Suits & Blazers");
        MEN.add("Casual Shorts");
        MEN.add("Men's Sets");
        MEN.add("Board Shorts");
    }
    //add LUGGAGE_AND_BAGS list
    static  {
        LUGGAGE_AND_BAGS.add("Women's Bags");
        LUGGAGE_AND_BAGS.add("Men's Bags");
        LUGGAGE_AND_BAGS.add("Backpacks");
        LUGGAGE_AND_BAGS.add("Wallets");
        LUGGAGE_AND_BAGS.add("Kids & Baby's Bags");
        LUGGAGE_AND_BAGS.add("Luggage & Travel Bags");
        LUGGAGE_AND_BAGS.add("Functional Bags");
        LUGGAGE_AND_BAGS.add("Coin Purses & Holders");
        LUGGAGE_AND_BAGS.add("Bag Parts & Accessories");
    }
    //add SHOES list
    static {
        SHOES.add("Women's Shoes");
        SHOES.add("Women's Flats");
        SHOES.add("Women's Pumps");
        SHOES.add("Men's Shoes");
        SHOES.add("Men's Casual Shoes");
        SHOES.add("Women's Vulcanize Shoes");
        SHOES.add("Men's Vulcanize Shoes");
        SHOES.add("Women's Boots");
        SHOES.add("Men's Boots");
        SHOES.add("Shoe Accessories");
    }
    //add MOTHER_AND_KIDS list
    static {
        MOTHER_AND_KIDS.add("Girls' Baby Clothing");
        MOTHER_AND_KIDS.add("Boys' Baby Clothing");
        MOTHER_AND_KIDS.add("Girls' Clothing");
        MOTHER_AND_KIDS.add("Boys' Clothing");
        MOTHER_AND_KIDS.add("Baby Shoes");
        MOTHER_AND_KIDS.add("Children's Shoes");
        MOTHER_AND_KIDS.add("Baby Care");
        MOTHER_AND_KIDS.add("Activity & Gear");
        MOTHER_AND_KIDS.add("Safety Equipment");
        MOTHER_AND_KIDS.add("Baby Bedding");
        MOTHER_AND_KIDS.add("Feeding");
        MOTHER_AND_KIDS.add("Matching Family Outfits");
        MOTHER_AND_KIDS.add("Toilet Training");
        MOTHER_AND_KIDS.add("Pregnancy & Maternity");
        MOTHER_AND_KIDS.add("Baby Souvenirs");
        MOTHER_AND_KIDS.add("Baby Furniture");
        MOTHER_AND_KIDS.add("Baby Food");
    }
    static {
        WATCHES.add("Men's Watches");
        WATCHES.add("Women's Watches");
        WATCHES.add("Lover's Watches");
        WATCHES.add("Children's Watches");
        WATCHES.add("Pocket & Fob Watches");
        WATCHES.add("Watch Accessories");
        WATCHES.add("Women's Bracelet Watches");
    }
}
