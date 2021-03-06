package com.store.service;

import com.store.model.product.Colour;
import com.store.model.product.Size;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.Set;

class UtilitiesService {

    static boolean isNotValidString(final String str) {
        return StringUtils.isEmpty(str);
    }

    static boolean isValidId(final String str) {
        boolean isNumeric = str.matches("-?\\d+(\\.\\d+)?");

        if (!isNumeric) {
            return false;
        }

        double num = Double.parseDouble(str);

        if ((num % 1) != 0) {
            return false;
        }

        long id = Long.parseLong(str);

        return id > 0;
    }

    static boolean isNotValidPrice(Double price) {
        if (price == null) return true;
        return price <= 0;
    }

    static boolean isNotValidSize(Set<Size> sizes) {
        if (sizes == null) return true;
        return sizes.isEmpty();
    }

    static boolean isNotColour(Set<Colour> colour) {
        if (colour == null) return true;
        return colour.isEmpty();
    }

    static boolean isNotValidIdRelatedProduct(String[] relatedProducts) {

        boolean isEmpty = true;
        for (String str: relatedProducts) {
            if (!StringUtils.isEmpty(str))
                isEmpty = false;
        }
        if (isEmpty) return false;

        if (relatedProducts.length > 3) return true;

        boolean checkNotValid = true;

        for(String str: relatedProducts) {
            if (UtilitiesService.isValidId(str)) {
                checkNotValid = false;
            }
        }
        return checkNotValid;
    }

    static boolean isNotValidPhoto(MultipartFile... photos) {
        int count = 0;
        for (MultipartFile file: photos) {
            if (!StringUtils.isEmpty(file.getOriginalFilename())) {
                count++;
            }
        }
        if (count < 2) return true;

        for (MultipartFile file: photos) {
            if (UtilitiesService.isNotValidString(file.getContentType())) {
                return true;
            }
        }

        return false;
    }

//    public static void main(String[] args) {
//        String str = "(1, '9106ab0a-1ecd-4126-8ad6-f225200b67a9.8.jpg', 'Brand', 'MEN', 'Details', '91a9d265-6a5f-4e1f-9ea5-0ccc7dea2052.w2.jpg', 'Watches', 'true', '100.0', null, 'Hoodies & Sweatshirts', 'true', %s),";
//        String size = "(%s, 'L'),";
//        String color = "(%s, 'COLOR1'),";
//
//        for (int i = 46; i < 51; i++){
//            System.out.println(String.format(color, i));
//
//        }
//    }
}
