package com.store.service;

import com.store.config.TelegramBot;
import com.store.model.*;
import com.store.model.product.Product;
import com.store.model.product.Size;
import com.store.model.user.User;
import com.store.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class StoreService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private CreditCardRepository creditCardRepository;

    @Autowired
    private ParcelRepository parcelRepository;

    @Autowired
    private ProductItemRepository productItemRepository;

    @Autowired
    private UserRepository userRepository;

    private TelegramBot bot = new TelegramBot();

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
            order.setUser(user);

            if (!user.getBasket().contains(order)) {
                user.getBasket().add(order);
                orderRepository.save(order);
            }
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
        StringBuilder message = new StringBuilder("User: " + user.getAddresses().getName() + "paid for:\n");

        double price = 0;

        for (Order order: user.getBasket()) {
            Product product = productRepository.findById(order.getProduct().getProductId());

            if (product != null) {
                product.upRating();
                productRepository.save(product);

                Parcel parcel = new Parcel();

                parcel.setCreditCard(creditCard);
                parcel.setAddress(user.getAddresses());
                parcel.setUser(user);
                parcel.setProduct(order.getProduct());

                parcelRepository.save(parcel);

                user.getPurchases().add(parcel);

                message.append("id: ").append(product.getId()).append(" size: ").append(parcel.getProduct().getSize()).append("\n");
                price += product.getPrice();
            }
        }

        message.append("Total price: ").append(price).append(" + cost of delivery").append("\n");
        message.append(user.getAddresses().toString());

        bot.sendMessage(message.toString());

        user.getBasket().clear();
        orderRepository.deleteAllByUser(user);
    }
}
