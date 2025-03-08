package com.example.megacitycab.models;


public class Customer {
    private int customerID;
    private String nic;
    private String name;
    private String email;
    private String phoneNumber;
    private String password;

    // Constructor
    public Customer(int customerID, String nic, String name, String email, String phoneNumber, String password) {
        this.customerID = customerID;
        this.nic = nic;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }

    // Constructor without ID (for new customers)
    public Customer(String nic, String name, String email, String phoneNumber, String password) {
        this.nic = nic;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }

    // Getters and Setters
    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
