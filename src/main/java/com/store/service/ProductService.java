package com.store.service;

import com.store.config.WebConfig;
import com.store.model.store.Order;
import com.store.model.store.ProductItem;
import com.store.model.product.Categories;
import com.store.model.product.Colour;
import com.store.model.product.Product;
import com.store.model.product.Size;
import com.store.model.user.User;
import com.store.repository.OrderRepository;
import com.store.repository.ProductItemRepository;
import com.store.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final ProductItemRepository productItemRepository;
    private final OrderRepository orderRepository;

    @Autowired
    public ProductService(ProductRepository productRepository, ProductItemRepository productItemRepository, OrderRepository orderRepository) {
        this.productRepository = productRepository;
        this.productItemRepository = productItemRepository;
        this.orderRepository = orderRepository;
    }

    public void addNewProduct(User user, String name, String brand, Double price, Set<Size> sizes,
                              Boolean specialOffers, Boolean newArrivals, Categories categories,
                              String section, Set<Colour> colour, String details, String[] relatedProducts,
                              MultipartFile[] photos) throws IOException {
        Product product = new Product();

        product.setName(name);
        product.setBrand(brand);
        product.setPrice(price);
        product.setSize(sizes);
        product.setSpecialOffers(specialOffers);
        product.setNewArrivals(newArrivals);
        product.setCategories(categories);
        product.setSection(section);
        product.setColour(colour);
        product.setDetails(details);
        product.setAuthor(user);

        Set<Product> products = new HashSet<>();

        for (String id: relatedProducts) {
            if (!StringUtils.isEmpty(id)) {
                long longId = Long.parseLong(id);
                Product p = productRepository.findById(longId);
                products.add(p);
            }
        }

        product.setRelatedProducts(products);

        product.setMainPhoto(getOriginalFilename(photos[0]));

        product.setAvatarPhoto(getOriginalFilename(photos[1]));

        Set<String> photo = new HashSet<>();
        for (int i = 2; i < photos.length; i++) {
            photo.add(getOriginalFilename(photos[i]));
        }
        product.setPhotos(photo);

        productRepository.save(product);
    }



    private String getOriginalFilename(MultipartFile file) throws IOException {
        String uploadPath = WebConfig.getUploadPath();

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFileName));

            return resultFileName;
        }
        return null;
    }

    public List<Product> getListSpecialOffers() {
        List<Product> productList = productRepository.findBySpecialOffers(true);

        if (productList.size() > 4) {
            Random random = new Random();

            int first = random.nextInt(productList.size());
            int second = random.nextInt(productList.size());
            int third = random.nextInt(productList.size());
            int fourth = random.nextInt(productList.size());

            return Arrays.asList(productList.get(first), productList.get(second), productList.get(third), productList.get(fourth));
        }

        else return productList;
    }

    public Product getProductId(String productId) {
        if (UtilitiesService.isValidId(productId)) {
            long id = Long.parseLong(productId);

            return productRepository.findById(id);
        }

        return null;
    }

    public Page<Product> searchProduct(String text, Pageable page) {
        return productRepository.findByNameContainingOrBrandContaining(text, text, page);
    }

    public List<Product> getAllProduct() {
        return productRepository.findAll();
    }

    public void removeProduct(String productId) {

        if (UtilitiesService.isValidId(productId)) {
            long id = Long.parseLong(productId);

            Product product = productRepository.findById(id);

            List<Product> productList = productRepository.findByRelatedProducts(product);

            for (Product p: productList) {
                p.getRelatedProducts().remove(product);
                productRepository.save(p);
            }

            List<ProductItem> productItems = productItemRepository.findByProductId(id);

            for (ProductItem item: productItems) {
                item.setOnSale(false);
                productItemRepository.save(item);

                List<Order> listOrderContainingRemovedProduct = orderRepository.findByProduct(item);

                for (Order order: listOrderContainingRemovedProduct) {
                    Set<Order> orders = new HashSet<>();

                    for (Order orderUser: order.getUser().getBasket()) {
                        if (!orderUser.getId().equals(order.getId())) {
                            orders.add(orderUser);
                        }
                    }

                    order.getUser().setBasket(orders);
                    orderRepository.deleteById(order.getId());
                }
            }

            productRepository.deleteById(id);
        }
    }

    public Map<String, Object> editProduct(String productId, String name, String brand, Double price, Set<Size> sizes, Boolean specialOffers, Boolean newArrivals, String[] relatedProducts) {

        if (UtilitiesService.isValidId(productId)) {
            long id = Long.parseLong(productId);
            Product product = productRepository.findById(id);

            Map<String, Object> productError = new HashMap<>();

            boolean checkValidProduct = true;
            boolean checkEditProduct = false;

            if (UtilitiesService.isNotValidString(name)) {
                productError.put("nameError", "Invalid name!");
                checkValidProduct = false;
            } else if (!product.getName().equals(name)) {
                product.setName(name);
                checkEditProduct = true;
            }

            if (UtilitiesService.isNotValidString(brand)) {
                productError.put("brandError", "Invalid brand!");
                checkValidProduct = false;
            } else if (!product.getBrand().equals(brand)) {
                product.setBrand(brand);
                checkEditProduct = true;
            }


            if (UtilitiesService.isNotValidPrice(price)) {
                productError.put("priceError", "Invalid price!");
                checkValidProduct = false;
            } else if (product.getPrice() != price) {
                product.setPrice(price);
                checkEditProduct = true;
            }

            if (UtilitiesService.isNotValidSize(sizes)) {
                productError.put("sizesError", "Invalid sizes!");
                checkValidProduct = false;
            } else if (!product.getSize().equals(sizes)){
                product.setSize(sizes);
                checkEditProduct = true;
            }

            if (specialOffers == null) {
                productError.put("specialOffersError", "Invalid special offers!");
                checkValidProduct = false;
            } else if (product.isSpecialOffers() != specialOffers) {
                product.setSpecialOffers(specialOffers);
                checkEditProduct = true;
            }

            if (newArrivals == null) {
                productError.put("newArrivalsError", "Invalid new arrivals!");
                checkValidProduct = false;
            } else if (product.isNewArrivals() != newArrivals) {
                product.setNewArrivals(newArrivals);
                checkEditProduct = true;
            }

            if (UtilitiesService.isNotValidIdRelatedProduct(relatedProducts)) {
                productError.put("relatedProductsError", "Invalid related products!");
                checkValidProduct = false;
            } else {
                Set<Product> products = new HashSet<>();

                for (String i: relatedProducts) {
                    if (!StringUtils.isEmpty(i)) {
                        long longId = Long.parseLong(i);
                        Product relatedProduct = productRepository.findById(longId);
                        if (relatedProduct != null)
                            products.add(relatedProduct);
                    }

                }

                if (products.size() < 3) {
                    for (Product p: product.getRelatedProducts()) {
                        if (products.size() >= 3) break;

                        products.add(p);
                    }
                }

                product.setRelatedProducts(products);

                checkEditProduct = true;

            }

            if (checkValidProduct & checkEditProduct) {
                productRepository.save(product);
                return Collections.singletonMap("success", "Product updated successfully!");
            } else return productError;
        }


        return null;
    }

    public Map<String, Object> isValidProduct(String name, String brand, Double price, Set<Size> sizes,
                                              Boolean specialOffers, Boolean newArrivals, Categories categories,
                                              String section, Set<Colour> colour, String details, String[] relatedProducts,
                                              MultipartFile[] photos) {
        Map<String, Object> attribute = new HashMap<>();

        boolean checkValidProduct = true;

        if (UtilitiesService.isNotValidString(name)) {
            attribute.put("nameError", "Invalid name!");
            checkValidProduct = false;
        } else attribute.put("name", name);

        if (UtilitiesService.isNotValidString(brand)) {
            attribute.put("brandError", "Invalid brand!");
            checkValidProduct = false;
        } else attribute.put("brand", brand);

        if (UtilitiesService.isNotValidPrice(price)) {
            attribute.put("priceError", "Invalid price!");
            checkValidProduct = false;
        } else attribute.put("price", price);

        if (UtilitiesService.isNotValidSize(sizes)) {
            attribute.put("sizesError", "Invalid sizes!");
            checkValidProduct = false;
        }

        if (specialOffers == null) {
            attribute.put("specialOffersError", "Invalid special offers!");
            checkValidProduct = false;
        }

        if (newArrivals == null) {
            attribute.put("newArrivalsError", "Invalid new arrivals!");
            checkValidProduct = false;
        }

        if (categories == null) {
            attribute.put("categoriesError", "Invalid categories!");
            checkValidProduct = false;
        }

        if (UtilitiesService.isNotValidString(section)) {
            attribute.put("sectionError", "Invalid section!");
            checkValidProduct = false;
        }

        if (UtilitiesService.isNotColour(colour)) {
            attribute.put("colourError", "Invalid colour!");
            checkValidProduct = false;
        }

        if (UtilitiesService.isNotValidString(details)) {
            attribute.put("detailsError", "Invalid details!");
            checkValidProduct = false;
        } else if (details.length() > 600) {
            attribute.put("detailsError", "Invalid details, maximum 600 characters!");
            checkValidProduct = false;
        }

        if (UtilitiesService.isNotValidIdRelatedProduct(relatedProducts)) {
            attribute.put("relatedProductsError", "Invalid related products!");
            checkValidProduct = false;
        }

        if (UtilitiesService.isNotValidPhoto(photos)) {
            attribute.put("photosError", "Select at least 2 photos!");
            checkValidProduct = false;
        }

        if (checkValidProduct)
            return null;
        else return attribute;
    }

    public Page<Product> getListProduct(String nameCategories, String nameSection, Boolean newArrivals, Set<String> brand, Set<Colour> colour, Set<Size> size, Pageable pageable) {
        int method = defineMethod(brand, colour, size);

        switch (method) {
            case 1: return filterOutBrand(newArrivals, nameCategories, nameSection, brand, pageable);

            case 2: return filterOutColour(newArrivals, nameCategories, nameSection, colour, pageable);

            case 3: return filterOutSize(newArrivals, nameCategories, nameSection, size, pageable);

            case 4: return filterOutBrandAndColour(newArrivals, nameCategories, nameSection, brand, colour, pageable);

            case 5: return filterOutBrandAndSize(newArrivals, nameCategories, nameSection, brand, size, pageable);

            case 6: return filterOutColourAndSize(newArrivals, nameCategories, nameSection, colour, size, pageable);

            case 7: return filterOutBrandColourAndSize(newArrivals, nameCategories, nameSection, brand, colour, size, pageable);

            default: return filterOutProduct(nameCategories, nameSection, newArrivals, pageable);
        }
    }

    private int defineMethod(Set<String> brand, Set<Colour> colour, Set<Size> size) {
        if (brand != null && colour == null && size == null) return 1;
        if (brand == null && colour != null && size == null) return 2;
        if (brand == null && colour == null && size != null) return 3;

        if (brand != null && colour != null && size == null) return 4;
        if (brand != null && colour == null && size != null) return 5;
        if (brand == null && colour != null && size != null) return 6;

        if (brand != null && colour != null && size != null) return 7;

        return 0;
    }

    private Page<Product> filterOutBrandColourAndSize(Boolean newArrivals, String nameCategories, String nameSection, Set<String> brand, Set<Colour> colour, Set<Size> size, Pageable pageable) {
        if (newArrivals) {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndNewArrivalsAndBrandInAndColourInAndSizeIn(categories, nameSection, true, brand, colour, size, pageable);
                } else return productRepository.findByCategoriesAndNewArrivalsAndBrandInAndColourInAndSizeIn(categories, true, brand, colour, size, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findByNewArrivalsAndBrandInAndColourInAndSizeIn(true,brand, colour, size, pageable);
            }
        } else {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndBrandInAndColourInAndSizeIn(categories, nameSection, brand, colour, size, pageable);
                } else return productRepository.findByCategoriesAndBrandInAndColourInAndSizeIn(categories,brand, colour, size, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findAllByBrandInAndColourInAndSizeIn(colour,brand, size, pageable);
            }
        }
    }

    private Page<Product> filterOutColourAndSize(Boolean newArrivals, String nameCategories, String nameSection, Set<Colour> colour, Set<Size> size, Pageable pageable) {
        if (newArrivals) {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndNewArrivalsAndColourInAndSizeIn(categories, nameSection, true, colour, size, pageable);
                } else return productRepository.findByCategoriesAndNewArrivalsAndColourInAndSizeIn(categories, true, colour, size, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findByNewArrivalsAndColourInAndSizeIn(true, colour, size, pageable);
            }
        } else {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndColourInAndSizeIn(categories, nameSection, colour, size, pageable);
                } else return productRepository.findByCategoriesAndColourInAndSizeIn(categories, colour, size, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findAllByColourInAndSizeIn(colour, size, pageable);
            }
        }
    }

    private Page<Product> filterOutBrandAndSize(Boolean newArrivals, String nameCategories, String nameSection, Set<String> brand, Set<Size> size, Pageable pageable) {
        if (newArrivals) {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndNewArrivalsAndBrandInAndSizeIn(categories, nameSection, true, brand, size, pageable);
                } else return productRepository.findByCategoriesAndNewArrivalsAndBrandInAndSizeIn(categories, true, brand, size, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findByNewArrivalsAndBrandInAndSizeIn(true, brand, size, pageable);
            }
        } else {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndBrandInAndSizeIn(categories, nameSection, brand, size, pageable);
                } else return productRepository.findByCategoriesAndBrandInAndSizeIn(categories, brand, size, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findAllByBrandInAndSizeIn(brand, size, pageable);
            }
        }

    }

    private Page<Product> filterOutBrandAndColour(Boolean newArrivals, String nameCategories, String nameSection, Set<String> brand, Set<Colour> colour, Pageable pageable) {
        if (newArrivals) {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndNewArrivalsAndBrandInAndColourIn(categories, nameSection, true, brand, colour, pageable);
                } else return productRepository.findByCategoriesAndNewArrivalsAndBrandInAndColourIn(categories, true, brand, colour, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findByNewArrivalsAndBrandInAndColourIn(true, brand, colour, pageable);
            }
        } else {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndBrandInAndColourIn(categories, nameSection, brand, colour, pageable);
                } else return productRepository.findByCategoriesAndBrandInAndColourIn(categories, brand, colour, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findAllByBrandInAndColourIn(brand, colour, pageable);
            }
        }

    }

    private Page<Product> filterOutSize(Boolean newArrivals, String nameCategories, String nameSection, Set<Size> size, Pageable pageable) {
        if (newArrivals) {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndNewArrivalsAndSizeIn(categories, nameSection, true, size, pageable);
                } else return productRepository.findByCategoriesAndNewArrivalsAndSizeIn(categories, true, size, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findByNewArrivalsAndSizeIn(true, size, pageable);
            }
        } else {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndSizeIn(categories, nameSection, size, pageable);
                } else return productRepository.findByCategoriesAndSizeIn(categories, size,pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findAllBySizeIn(size, pageable);
            }
        }
    }

    private Page<Product> filterOutColour(Boolean newArrivals, String nameCategories, String nameSection, Set<Colour> colour, Pageable pageable) {
        if (newArrivals) {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndNewArrivalsAndColourIn(categories, nameSection, true, colour, pageable);
                } else return productRepository.findByCategoriesAndNewArrivalsAndColourIn(categories, true, colour, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findByNewArrivalsAndColourIn(true, colour, pageable);
            }
        } else {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndColourIn(categories, nameSection, colour, pageable);
                } else return productRepository.findByCategoriesAndColourIn(categories, colour,pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findAllByColourIn(colour, pageable);
            }
        }
    }

    private Page<Product> filterOutBrand(Boolean newArrivals, String nameCategories, String nameSection, Set<String> brand, Pageable pageable) {
        if (newArrivals) {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndNewArrivalsAndBrandIn(categories, nameSection, true, brand, pageable);
                } else return productRepository.findByCategoriesAndNewArrivalsAndBrandIn(categories, true, brand, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findByNewArrivalsAndBrandIn(true, brand, pageable);
            }
        } else {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndBrandIn(categories, nameSection, brand, pageable);
                } else return productRepository.findByCategoriesAndBrandIn(categories, brand,pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findAllByBrandIn(brand, pageable);
            }
        }
    }

    private Page<Product> filterOutProduct(String nameCategories, String nameSection, Boolean newArrivals, Pageable pageable) {
        if (newArrivals) {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSectionAndNewArrivalsTrue(categories, nameSection, pageable);
                } else return productRepository.findByCategoriesAndNewArrivalsTrue(categories, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findByNewArrivalsTrue(pageable);
            }
        } else {
            try {
                Categories categories = Categories.valueOf(nameCategories);

                if (Objects.requireNonNull(categories.getListSection()).contains(nameSection)) {
                    return productRepository.findByCategoriesAndSection(categories, nameSection, pageable);
                } else return productRepository.findByCategories(categories, pageable);

            } catch (IllegalArgumentException e) {
                return productRepository.findAllBy(pageable);
            }
        }
    }
}