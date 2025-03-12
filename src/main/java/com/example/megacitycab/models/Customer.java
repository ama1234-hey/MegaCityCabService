package com.example.megacitycab.models;

public class Customer {
    private int customerId;
    private String name;
    private String email;
    private String phoneNumber;
    private String nic; // National Identity Card Number

    public Customer(int customerId, String name, String email, String phoneNumber, String nic) {
        this.customerId = customerId;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.nic = nic;
    }

    // Getters
    public int getCustomerId() {
        return customerId;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getNic() {
        return nic;
    }

    // Setters
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }
}
