package com.store.controller;

import com.store.model.product.Categories;
import com.store.model.product.Colour;
import com.store.model.product.Product;
import com.store.model.product.Size;
import com.store.model.user.User;
import com.store.service.MailService;
import com.store.service.ProductService;
import com.store.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;


@Controller
@RequestMapping(value = "/admin")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private MailService mailService;

    @RequestMapping(value = "/addNewProduct", method = RequestMethod.GET)
    public String addProduct(@AuthenticationPrincipal User user, Model model,
                             @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        addAttribute(model, user);
        return "/addNewProduct";
    }

    @RequestMapping(value = "/addNewProduct", method = RequestMethod.POST)
    public String addProduct(
            @AuthenticationPrincipal User user,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam(name = "brand", required = false) String brand,
            @RequestParam(name = "price", required = false) Double price,
            @RequestParam(name = "size", required = false) Set<Size> sizes,
            @RequestParam(name = "offers", required = false) Boolean specialOffers,
            @RequestParam(name = "newArrivals", required = false) Boolean newArrivals,
            @RequestParam(name = "categories", required = false) Categories categories,
            @RequestParam(name = "section", required = false) String section,
            @RequestParam(name = "colour", required = false) Set<Colour> colour,
            @RequestParam(name = "details", required = false) String details,
            @RequestParam(name = "relatedProducts", required = false) String[] relatedProducts,
            @RequestParam(name = "photo", required = false) MultipartFile[] photos,
            Model model,
            @RequestParam(name = "newsletter", required = false) String email
    ) throws IOException {

        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        Map<String, Object> attribute = productService.isValidProduct(name, brand, price, sizes, specialOffers, newArrivals, categories, section, colour, details, relatedProducts, photos);

        if (attribute == null) {
            productService.addNewProduct(user, name, brand, price, sizes, specialOffers, newArrivals, categories, section, colour, details, relatedProducts, photos);
            model.addAttribute("success", "Product successfully added!");
        } else {
            model.addAllAttributes(attribute);
        }

        addAttribute(model, user);
        return "addNewProduct";
    }

    @RequestMapping(value = "/editProduct", method = RequestMethod.GET)
    public String editProduct(@AuthenticationPrincipal User user, Model model,
                              @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        // @PageableDefault(sort = "id", direction = Sort.Direction.DESC, size = 16) Pageable page,
        List<Product> products = productService.getAllProduct();
        model.addAttribute("products", products);
        model.addAttribute("user", user);

        return "editProduct";
    }

    @RequestMapping(value = "removeProduct/{productId}", method = RequestMethod.GET)
    public String removeProduct(@AuthenticationPrincipal User user, @PathVariable String productId, Model model,
                                @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        productService.removeProduct(productId);

        List<Product> products = productService.getAllProduct();

        model.addAttribute("products", products);
        model.addAttribute("user", user);
        return "editProduct";
    }

    @RequestMapping(value = "editProductDetails/{productId}", method = RequestMethod.GET)
    public String editProductDetails(
            @AuthenticationPrincipal User user,
            @PathVariable String productId,
            Model model,
            @RequestParam(name = "newsletter", required = false) String email
    ) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        Product product = productService.getProductId(productId);

        addAttribute(model, user, product);

        return "editProductDetails";
    }

    @RequestMapping(value = "/editProductDetails/{productId}", method = RequestMethod.POST)
    public String editProductDetails(
            @AuthenticationPrincipal User user,
            @PathVariable String productId,
            @RequestParam(name = "name") String name,
            @RequestParam(name = "brand") String brand,
            @RequestParam(name = "price") Double price,
            @RequestParam(name = "size") Set<Size> sizes,
            @RequestParam(name = "offers") Boolean specialOffers,
            @RequestParam(name = "newArrivals") Boolean newArrivals,
            @RequestParam(name = "relatedProducts") String[] relatedProducts,
            Model model,
            @RequestParam(name = "newsletter", required = false) String email
    ) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        Map<String, Object> attribute = productService.editProduct(productId, name, brand, price, sizes, specialOffers, newArrivals, relatedProducts);
        model.addAllAttributes(attribute);

        Product product = productService.getProductId(productId);

        addAttribute(model, user, product);

        return "editProductDetails";
    }

    private void addAttribute(Model model, User user) {
        model.addAttribute("user", user);
        model.addAttribute("size", Size.values());
        model.addAttribute("categories", Categories.values());
        model.addAttribute("colour", Colour.values());
    }

    private void addAttribute(Model model, User user, Product product) {
        model.addAttribute("product", product);
        model.addAttribute("user", user);
        model.addAttribute("size", Size.values());
    }
}
