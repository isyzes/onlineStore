package com.store.service;

import com.store.config.TelegramBot;
import com.store.model.product.Product;
import com.store.model.product.Size;
import com.store.model.store.*;
import com.store.model.user.User;
import com.store.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@Service
public class StoreService {
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;
    private final AddressRepository addressRepository;
    private final CreditCardRepository creditCardRepository;
    private final ParcelRepository parcelRepository;
    private final ProductItemRepository productItemRepository;
    private final UserRepository userRepository;

    @Autowired
    public StoreService(ProductRepository productRepository, OrderRepository orderRepository, AddressRepository addressRepository, CreditCardRepository creditCardRepository, ParcelRepository parcelRepository, ProductItemRepository productItemRepository, UserRepository userRepository) {
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
        this.addressRepository = addressRepository;
        this.creditCardRepository = creditCardRepository;
        this.parcelRepository = parcelRepository;
        this.productItemRepository = productItemRepository;
        this.userRepository = userRepository;
    }

    private TelegramBot bot = TelegramBot.getInstance();


    public void addToCart(User user, String productId, Size size) {
        if (UtilitiesService.isValidId(productId)) {
            long id = Long.parseLong(productId);

            Product product = productRepository.findById(id);

            ProductItem productItem = new ProductItem();
            productItem.setName(product.getName());
            productItem.setAvatarPhoto(product.getAvatarPhoto());
            productItem.setBrand(product.getBrand());
            productItem.setPrice(product.getPrice());
            productItem.setSize(size);
            productItem.setProductId(id);
            productItem.setOnSale(true);

            productItemRepository.save(productItem);

            Order order = new Order();
            order.setProduct(productItem);
            order.setUsers(Collections.singleton(user));
            orderRepository.save(order);

            user.getBasket().add(order);

            userRepository.save(user);
        }
    }

    public void removeFromCart(User user, long orderId) {
        Order removeOrder = orderRepository.findById(orderId);

        Set<Order> orders = new HashSet<>();

        for (Order order: user.getBasket()) {
            if (!removeOrder.getId().equals(order.getId())) {
                orders.add(order);
            }
        }
        user.setBasket(orders);

        userRepository.save(user);
        orderRepository.deleteById(orderId);
    }

    public void addAddress(User user, String name, String mobile, String street, String apartment, String country, String state, String city, String zip) {
        Address address = new Address();
        address.setName(name);
        address.setMobile(mobile);
        address.setStreet(street);
        address.setApartment(apartment);
        address.setCountry(country);
        address.setState(state);
        address.setCity(city);
        address.setZip(zip);

        if (!address.equals(user.getAddresses())) {
            addressRepository.save(address);
            user.setAddresses(address);
            userRepository.save(user);
        }
    }

    public void buyProduct(User user, String cardNumber, String holder, String expires, String cvv) {
        CreditCard creditCard = new CreditCard();
        creditCard.setCardNumber(cardNumber);
        creditCard.setHolder(holder);
        creditCard.setExpires(expires);
        creditCard.setCvv(cvv);

        if (!creditCard.equals(user.getCreditCards())) {
            creditCardRepository.save(creditCard);
            user.setCreditCards(creditCard);
            userRepository.save(user);
        }
        StringBuilder message = new StringBuilder("User: " + user.getAddresses().getName() + " paid for:\n");

        double price = 0;

        for (Order order: user.getBasket()) {
            Product product = productRepository.findById(order.getProduct().getProductId());

            if (product != null) {
                product.upRating();
                productRepository.save(product);

                Parcel parcel = new Parcel();

                parcel.setCreditCard(user.getCreditCards());
                parcel.setAddress(user.getAddresses());
                parcel.setUsers(Collections.singleton(user));
                parcel.setProduct(order.getProduct());

                parcelRepository.save(parcel);

                user.getPurchases().add(parcel);

                message.append("id: ").append(product.getId()).append(" size: ").append(parcel.getProduct().getSize()).append("\n");
                price += product.getPrice();
            }
        }

        message.append("Total price: ").append(price).append(" + cost of delivery").append("\n");
        message.append(user.getAddresses().toString());


        user.getBasket().clear();
        userRepository.save(user);

        orderRepository.deleteAllByUsers(Collections.singleton(user));

        bot.sendMessage(message.toString());
    }
}
