package com.example.megacitycab.models;

public class Driver {
    private int driverID;
    private String name;
    private String licenseNumber;
    private String phoneNumber;
    private String email;
    private boolean availability;

    public Driver(int driverID, String name, String licenseNumber, String phoneNumber, String email, boolean availability) {
        this.driverID = driverID;
        this.name = name;
        this.licenseNumber = licenseNumber;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.availability = availability;
    }

    public int getDriverID() { return driverID; }
    public String getName() { return name; }
    public String getLicenseNumber() { return licenseNumber; }
    public String getPhoneNumber() { return phoneNumber; }
    public String getEmail() { return email; }
    public boolean isAvailable() { return availability; }
}
