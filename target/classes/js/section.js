
const sections = {
    WOMEN: ["Dresses", "Blouses & Shirts", "Hoodies & Sweatshirts", "Sweaters", "Jackets & Coats", "Bottoms", "Rompers", "Tops & Tees", "Jumpsuits", "Bodysuits", "Suits & Sets"],
    MEN: ["Hoodies & Sweatshirts", "Tops & Tees", "Jackets & Coats", "Pants", "Shirts", "Jeans", "Sweaters", "Suits & Blazers", "Casual Shorts", "Men's Sets", "Board Shorts"],
    LUGGAGE_AND_BAGS: ["Women's Bags", "Men's Bags", "Backpacks", "Wallets", "Kids & Baby's Bags", "Luggage & Travel Bags", "Functional Bags", "Coin Purses & Holders", "Bag Parts & Accessories"],
    SHOES: ["Women's Shoes", "Women's Flats", "Women's Pumps", "Men's Shoes", "Men's Casual Shoes", "Women's Vulcanize Shoes", "Men's Vulcanize Shoes", "Women's Boots", "Men's Boots", "Shoe Accessories"],
    WATCHES: ["Men's Watches", "Women's Watches", "Lover's Watches", "Children's Watches", "Pocket & Fob Watches", "Watch Accessories", "Women's Bracelet Watches"]
};

function makeSubmenuProduct(value) {

    if (value.length == 0) {
        document.getElementById("section").innerHTML = "<option></option>";
    }
    else {
        let citiesOptions = "";
        for (let cityId in sections[value]) {
            citiesOptions += "<option>" + sections[value][cityId] + "</option>";
        }
        document.getElementById("section").innerHTML = citiesOptions;
    }
}

function resetSelections() {
    document.getElementById("categories").selectedIndex = 0;
    document.getElementById("section").selectedIndex = 0;
}