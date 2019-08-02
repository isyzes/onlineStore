package com.store.model.product;

public enum  Colour {
    COLOR1("color1"),
    COLOR2("color2"),
    COLOR3("color3"),
    COLOR4("color4"),
    COLOR5("color5"),
    COLOR6("color6"),
    COLOR7("color7"),
    COLOR8("color8"),
    COLOR9("color9"),
    COLOR10("color10"),
    COLOR11("color11"),
    COLOR12("color12"),
    COLOR13("color13"),
    COLOR14("color14"),
    COLOR15("color15");

    private String name;

    Colour(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name.toLowerCase();
    }
}
