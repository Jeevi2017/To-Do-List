package dto;

public class User {

    private int id;
    private String name;
    private String mail;
    private long contact;
    private String password;

    // Constructor for creating a User without an id
    public User(String name, String mail, long contact, String password) {
        this.name = name;
        this.mail = mail;
        this.contact = contact;
        this.password = password;
    }

    // Constructor for creating a User with an id
    public User(int id, String name, String mail, long contact, String password) {
        this.id = id;
        this.name = name;
        this.mail = mail;
        this.contact = contact;
        this.password = password;
    }

    // Default constructor
    public User() {
    }

    // Getter for id
    public int getId() {
        return id;
    }

    // Setter for id
    public void setId(int id) {
        this.id = id;
    }

    // Getter for name
    public String getName() {
        return name;
    }

    // Setter for name
    public void setName(String name) {
        this.name = name;
    }

    // Getter for mail
    public String getMail() {
        return mail;
    }

    // Setter for mail
    public void setMail(String mail) {
        this.mail = mail;
    }

    // Getter for contact
    public long getContact() {
        return contact;
    }

    // Setter for contact
    public void setContact(long contact) {
        this.contact = contact;
    }

    // Getter for password
    public String getPassword() {
        return password;
    }

    // Setter for password
    public void setPassword(String password) {
        this.password = password;
    }
}
