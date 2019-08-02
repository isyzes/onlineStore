package com.store.controller;

import com.store.model.product.Categories;
import com.store.model.product.Colour;
import com.store.model.product.Product;
import com.store.model.product.Size;
import com.store.model.user.User;
import com.store.service.MailService;
import com.store.service.ProductService;
import com.store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Set;


@Controller
public class StoreController {
    private final ProductService productService;

    private final StoreService storeService;

    private final MailService mailService;

    @Autowired
    public StoreController(ProductService productService, StoreService storeService, MailService mailService) {
        this.productService = productService;
        this.storeService = storeService;
        this.mailService = mailService;
    }


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(@AuthenticationPrincipal User user, Model model,
                       @RequestParam(name = "newsletter", required = false) String email) {
        model.addAttribute("user", user);
        model.addAttribute("specialOffers", productService.getListSpecialOffers());
        model.addAttribute("categories", Categories.values());

        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }
        return "index";
    }

    @RequestMapping(value = "listProduct/{newArrivals}/{categories}/{section}", method = RequestMethod.GET)
    public String getListProduct(
            @AuthenticationPrincipal User user,
            @PathVariable String categories,
            @PathVariable String section,
            @PathVariable Boolean newArrivals,
            @PageableDefault(sort = "rating", direction = Sort.Direction.DESC, size = 16) Pageable page,
            HttpServletRequest request,
            Model model,
            @RequestParam(name = "brand", required = false) Set<String> brand,
            @RequestParam(name = "colour", required = false) Set<Colour> colour,
            @RequestParam(name = "sizeProduct", required = false) Set<Size> sizeProduct,
            @RequestParam(name = "newsletter", required = false) String email
    ) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        Page<Product> products = productService.getListProduct(categories,section, newArrivals, brand, colour, sizeProduct, page);

        addAttribute(model, user, products, request);
        return "women";
    }

    @RequestMapping(value = "search")
    public String search(
            @AuthenticationPrincipal User user,
            @RequestParam(name = "search",required = false) String search,
            @PageableDefault(sort = "rating", direction = Sort.Direction.DESC, size = 16) Pageable page,
            HttpServletRequest request,
            Model model,
            @RequestParam(name = "newsletter", required = false) String email
    ) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        if (search != null)
            model.addAttribute("search", search);

        Page<Product> products = productService.searchProduct(search, page);
        addAttribute(model, user, products, request);
        return "women";
    }

    @RequestMapping(value = "/details/{productId}", method = RequestMethod.GET)
    public String getProductId(@AuthenticationPrincipal User user, @PathVariable String productId, Model model,
                               @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        Product product = productService.getProductId(productId);
        addAttribute(model, product, user);
        return "details";
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkout(@AuthenticationPrincipal User user, Model model,
                           @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        model.addAttribute("user", user);
        return "checkout";
    }

    @RequestMapping(value = "buyProduct/{productId}", method = RequestMethod.GET)
    public String addToCaraOrBuy(@AuthenticationPrincipal User user,
                                 @PathVariable String productId,
                                 @RequestParam(name = "sizes", required = false) Size size,
                                 @RequestParam(name = "action") String action,
                                 Model model,
                                 @RequestParam(name = "newsletter", required = false) String email) {
        if (size == null) {
            model.addAttribute("sizeError", "Select size!");
            Product product = productService.getProductId(productId);
            addAttribute(model, product, user);
            return "details";
        }

        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        if (action.equalsIgnoreCase("buy")) {
            storeService.addToCart(user, productId, size);
            model.addAttribute("user", user);
            return "checkout";

        } else { // action == add to Cart
            storeService.addToCart(user, productId, size);
            Product product = productService.getProductId(productId);
            addAttribute(model, product, user);
            return "details";
        }
    }

    @RequestMapping(value = "removeFromBasket/{orderId}", method = RequestMethod.GET)
    public String removeFromBasket(@AuthenticationPrincipal User user, @PathVariable Long orderId, Model model,
                                   @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        storeService.removeFromCart(user, orderId);
        model.addAttribute("user", user);
        return "checkout";
    }

    @RequestMapping(value = "/buy", method = RequestMethod.POST)
    public String buyProduct(
            @AuthenticationPrincipal User user,
            @RequestParam(name = "name") String name,
            @RequestParam(name = "mobile") String mobile,
            @RequestParam(name = "street") String street,
            @RequestParam(name = "apartment") String apartment,
            @RequestParam(name = "country") String country,
            @RequestParam(name = "state") String state,
            @RequestParam(name = "city") String city,
            @RequestParam(name = "zip") String zip,
            @RequestParam(name = "submit") String submit,
            Model model,
            @RequestParam(name = "newsletter", required = false) String email
    ) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        model.addAttribute("user", user);

        if (submit.equalsIgnoreCase("Confirm")) {
            storeService.addAddress(user, name, mobile, street, apartment, country, state, city, zip);
            model.addAttribute("user", user);
            return "creditcard";
        }

        return "checkout";
    }

    @RequestMapping(value = "/buy", method = RequestMethod.GET)
    public String buyProduct(@AuthenticationPrincipal User user, Model model,
                             @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        model.addAttribute("user", user);
        return "buy";
    }

    @RequestMapping(value = "/creditcard", method = RequestMethod.POST)
    public String creditCardSave(
            @AuthenticationPrincipal User user,
            @RequestParam(name = "cardNumber") String cardNumber,
            @RequestParam(name = "holder") String holder,
            @RequestParam(name = "expires") String expires,
            @RequestParam(name = "cvv") String cvv,
            @RequestParam(name = "submit") String submit,
            Model model,
            @RequestParam(name = "newsletter", required = false) String email
    ) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        model.addAttribute("user", user);

        if (submit.equalsIgnoreCase("Confirm")) {
            storeService.buyProduct(user, cardNumber, holder, expires, cvv);
            return "buy_finish";
        }

        return "buy";
    }

    @RequestMapping(value = "/creditcard", method = RequestMethod.GET)
    public String creditCardSave(@AuthenticationPrincipal User user, Model model,
                                 @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        model.addAttribute("user", user);
        return "creditcard";
    }


    private void addAttribute(Model model, Product product, User user) {
        model.addAttribute("user", user);
        model.addAttribute("categories", Categories.values());
        model.addAttribute("product", product);
    }

    private String search;
    private void addAttribute(Model model, User user, Page<Product> products, HttpServletRequest request) {

        model.addAttribute("user", user);
        model.addAttribute("products", products);
        model.addAttribute("categories", Categories.values());
        model.addAttribute("sortParam", products.getSort().toString().toLowerCase().replace(": ", ","));


        if (request.getRequestURI().contains("search")) {
            String url = request.getRequestURI() + "?" + request.getQueryString() + "&";

            if (search == null) {
                search = url;
            }
            if (!url.contains(search)) {
                search = url;
            }

            model.addAttribute("url", search);
        } else {
            model.addAttribute("url", request.getRequestURI());
        }
    }

}