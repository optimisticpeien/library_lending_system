package bean;

import java.util.Date;

public class BorrowingInformation {
    private String ID, peopleName, ISBN, bookName;
    private Date borrowingDate, returnDate;

    public BorrowingInformation() {
    }

    public BorrowingInformation(String ID, String peopleName, String ISBN, String bookName, Date borrowingDate, Date returnDate) {
        this.ID = ID;
        this.peopleName = peopleName;
        this.ISBN = ISBN;
        this.bookName = bookName;
        this.borrowingDate = borrowingDate;
        this.returnDate = returnDate;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getPeopleName() {
        return peopleName;
    }

    public void setPeopleName(String peopleName) {
        this.peopleName = peopleName;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Date getBorrowingDate() {
        return borrowingDate;
    }

    public void setBorrowingDate(Date borrowingDate) {
        this.borrowingDate = borrowingDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }
}
