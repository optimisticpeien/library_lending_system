package entity;

import java.util.Date;

public class Book {
    private String ISBN, name, author, press, type;
    private float pricing;
    private int number, remaining;
    private boolean borrow;
    private Date date;
    private String introduction;

    public Book() {
    }

    public Book(String ISBN, String name, String author, String press, String type, float pricing, int number, int remaining, boolean borrow, Date date, String introduction) {
        this.ISBN = ISBN;
        this.name = name;
        this.author = author;
        this.press = press;
        this.type = type;
        this.pricing = pricing;
        this.number = number;
        this.remaining = remaining;
        this.borrow = borrow;
        this.date = date;
        this.introduction = introduction;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public float getPricing() {
        return pricing;
    }

    public void setPricing(float pricing) {
        this.pricing = pricing;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getRemaining() {
        return remaining;
    }

    public void setRemaining(int remaining) {
        this.remaining = remaining;
    }

    public boolean isBorrow() {
        return borrow;
    }

    public void setBorrow(boolean borrow) {
        this.borrow = borrow;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
}
