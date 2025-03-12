package com.example.megacitycab.models;

import java.time.LocalDateTime;

public class Booking {
    private int orderId;
    private String customerName;
    private String address;
    private String telephoneNumber;
    private String pickupLocation;
    private String duration;
    private LocalDateTime orderDatetime;
    private String driverName;
    private String carModel;

    // Default constructor
    public Booking() {}

    // Constructor for inserting a new booking (without orderId)
    public Booking(String customerName, String address, String telephoneNumber, String pickupLocation,
                   String duration, LocalDateTime orderDatetime, String driverName, String carModel) {
        this.customerName = customerName;
        this.address = address;
        this.telephoneNumber = telephoneNumber;
        this.pickupLocation = pickupLocation;
        this.duration = duration;
        this.orderDatetime = orderDatetime;
        this.driverName = driverName;
        this.carModel = carModel;
    }

    // Constructor for fetching a booking from DB (with orderId)
    public Booking(int orderId, String customerName, String address, String telephoneNumber,
                   String pickupLocation, String duration, LocalDateTime orderDatetime,
                   String driverName, String carModel) {
        this.orderId = orderId;
        this.customerName = customerName;
        this.address = address;
        this.telephoneNumber = telephoneNumber;
        this.pickupLocation = pickupLocation;
        this.duration = duration;
        this.orderDatetime = orderDatetime;
        this.driverName = driverName;
        this.carModel = carModel;
    }

    // Getters and Setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getTelephoneNumber() { return telephoneNumber; }
    public void setTelephoneNumber(String telephoneNumber) { this.telephoneNumber = telephoneNumber; }

    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }

    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }

    public LocalDateTime getOrderDatetime() { return orderDatetime; }
    public void setOrderDatetime(LocalDateTime orderDatetime) { this.orderDatetime = orderDatetime; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getCarModel() { return carModel; }
    public void setCarModel(String carModel) { this.carModel = carModel; }
}
