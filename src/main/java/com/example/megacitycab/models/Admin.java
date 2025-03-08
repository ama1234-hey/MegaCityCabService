package com.example.megacitycab.models;





public class Admin {
    private int adminID;
    private String username;
    private String password;
    private String email;

    public Admin(int adminID, String username, String password, String email) {
        this.adminID = adminID;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public int getAdminID() { return adminID; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getEmail() { return email; }
}
