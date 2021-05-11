package com.met.shop.dto;

import com.met.shop.domain.Address;
import com.met.shop.domain.Payment;
import com.met.shop.domain.Shipping;

public class CheckoutDto {
    private Shipping shipping;
    private Address address;
    private Payment payment;

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }
}
