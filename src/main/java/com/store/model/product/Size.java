package com.store.model.product;

public enum Size {
    L(1),
    S(2),
    M(3),
    XL(4),
    XXL(5);

    private int i;
    Size(int i) {
        this.i = i;
    }
}
