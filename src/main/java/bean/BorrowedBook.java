package bean;

import java.util.Date;

public class BorrowedBook {
    private String ID, ISBN;
    private Date borrowingDate, returnDate;

    public BorrowedBook() {
    }

    public BorrowedBook(String ID, String ISBN, Date borrowingDate, Date returnDate) {
        this.ID = ID;
        this.ISBN = ISBN;
        this.borrowingDate = borrowingDate;
        this.returnDate = returnDate;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
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
