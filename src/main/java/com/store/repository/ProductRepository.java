package com.store.repository;

import com.store.model.product.Categories;
import com.store.model.product.Colour;
import com.store.model.product.Product;
import com.store.model.product.Size;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Product findById(long id);

    List<Product> findBySpecialOffers(boolean specialOffers);

    Page<Product> findByNameContainingOrBrandContaining(String name, String brand, Pageable pageable);
    Page<Product> findByCategoriesAndSection(Categories categories, String section, Pageable pageable);
    Page<Product> findByCategories(Categories categories, Pageable pageable);
    Page<Product> findAllBy(Pageable pageable);
    Page<Product> findByCategoriesAndSectionAndNewArrivalsTrue(Categories categories, String nameSection, Pageable pageable);
    Page<Product> findByCategoriesAndNewArrivalsTrue(Categories categories, Pageable pageable);
    Page<Product> findByNewArrivalsTrue(Pageable pageable);
    List<Product> findByRelatedProducts(Product relatedProducts);

    /** brand */
    Page<Product> findByCategoriesAndNewArrivalsAndBrandIn(Categories categories, boolean b, Set<String> brand, Pageable pageable);
    Page<Product> findByCategoriesAndSectionAndNewArrivalsAndBrandIn(Categories categories, String nameSection, boolean b, Set<String> brand, Pageable pageable);
    Page<Product> findByNewArrivalsAndBrandIn(boolean b, Set<String> brand, Pageable pageable);
    Page<Product> findByCategoriesAndSectionAndBrandIn(Categories categories, String nameSection, Set<String> brand, Pageable pageable);
    Page<Product> findByCategoriesAndBrandIn(Categories categories, Set<String> brand, Pageable pageable);
    Page<Product> findAllByBrandIn(Set<String> brand, Pageable pageable);

    /** colour */
    Page<Product> findByCategoriesAndSectionAndNewArrivalsAndColourIn(Categories categories, String nameSection, boolean b, Set<Colour> colour, Pageable pageable);
    Page<Product> findByCategoriesAndNewArrivalsAndColourIn(Categories categories, boolean b, Set<Colour> colour, Pageable pageable);
    Page<Product> findByNewArrivalsAndColourIn(boolean b, Set<Colour> colour, Pageable pageable);
    Page<Product> findByCategoriesAndSectionAndColourIn(Categories categories, String nameSection, Set<Colour> colour, Pageable pageable);
    Page<Product> findByCategoriesAndColourIn(Categories categories, Set<Colour> colour, Pageable pageable);
    Page<Product> findAllByColourIn(Set<Colour> colour, Pageable pageable);

    /**size*/
    Page<Product> findByCategoriesAndSectionAndNewArrivalsAndSizeIn(Categories categories, String nameSection, boolean b, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndNewArrivalsAndSizeIn(Categories categories, boolean b, Set<Size> size, Pageable pageable);
    Page<Product> findByNewArrivalsAndSizeIn(boolean b, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndSectionAndSizeIn(Categories categories, String nameSection, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndSizeIn(Categories categories, Set<Size> size, Pageable pageable);
    Page<Product> findAllBySizeIn(Set<Size> size, Pageable pageable);

    /** brand and colour*/
    Page<Product> findByCategoriesAndSectionAndNewArrivalsAndBrandInAndColourIn(Categories categories, String nameSection, boolean b, Set<String> brand, Set<Colour> colour, Pageable pageable);
    Page<Product> findByCategoriesAndNewArrivalsAndBrandInAndColourIn(Categories categories, boolean b, Set<String> brand, Set<Colour> colour, Pageable pageable);
    Page<Product> findByNewArrivalsAndBrandInAndColourIn(boolean b, Set<String> brand, Set<Colour> colour, Pageable pageable);
    Page<Product> findByCategoriesAndSectionAndBrandInAndColourIn(Categories categories, String nameSection, Set<String> brand, Set<Colour> colour, Pageable pageable);
    Page<Product> findByCategoriesAndBrandInAndColourIn(Categories categories, Set<String> brand, Set<Colour> colour, Pageable pageable);
    Page<Product> findAllByBrandInAndColourIn(Set<String> brand, Set<Colour> colour, Pageable pageable);

    /** brand and size*/
    Page<Product> findByCategoriesAndSectionAndNewArrivalsAndBrandInAndSizeIn(Categories categories, String nameSection, boolean b, Set<String> brand, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndNewArrivalsAndBrandInAndSizeIn(Categories categories, boolean b, Set<String> brand, Set<Size> size, Pageable pageable);
    Page<Product> findByNewArrivalsAndBrandInAndSizeIn(boolean b, Set<String> brand, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndSectionAndBrandInAndSizeIn(Categories categories, String nameSection, Set<String> brand, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndBrandInAndSizeIn(Categories categories, Set<String> brand, Set<Size> size, Pageable pageable);
    Page<Product> findAllByBrandInAndSizeIn(Set<String> brand, Set<Size> size, Pageable pageable);

    /** colour and size*/
    Page<Product> findByCategoriesAndSectionAndNewArrivalsAndColourInAndSizeIn(Categories categories, String nameSection, boolean b, Set<Colour> colour, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndNewArrivalsAndColourInAndSizeIn(Categories categories, boolean b, Set<Colour> colour, Set<Size> size, Pageable pageable);
    Page<Product> findByNewArrivalsAndColourInAndSizeIn(boolean b, Set<Colour> colour, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndSectionAndColourInAndSizeIn(Categories categories, String nameSection, Set<Colour> colour, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndColourInAndSizeIn(Categories categories, Set<Colour> colour, Set<Size> size, Pageable pageable);
    Page<Product> findAllByColourInAndSizeIn(Set<Colour> colour, Set<Size> size, Pageable pageable);

    /** brand and colour and size*/
    Page<Product> findByCategoriesAndSectionAndNewArrivalsAndBrandInAndColourInAndSizeIn(Categories categories, String section, boolean newArrivals,Set<String> brand, Set<Colour> colour,Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndNewArrivalsAndBrandInAndColourInAndSizeIn(Categories categories, boolean b, Set<String> brand, Set<Colour> colour, Set<Size> size, Pageable pageable);
    Page<Product> findByNewArrivalsAndBrandInAndColourInAndSizeIn(boolean b, Set<String> brand, Set<Colour> colour, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndSectionAndBrandInAndColourInAndSizeIn(Categories categories, String nameSection, Set<String> brand, Set<Colour> colour, Set<Size> size, Pageable pageable);
    Page<Product> findByCategoriesAndBrandInAndColourInAndSizeIn(Categories categories, Set<String> brand, Set<Colour> colour, Set<Size> size, Pageable pageable);
    Page<Product> findAllByBrandInAndColourInAndSizeIn(Set<Colour> colour, Set<String> brand, Set<Size> size, Pageable pageable);


}
