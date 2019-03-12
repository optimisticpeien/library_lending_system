package bean;

import java.util.Date;

public class BorrowingBookInformation extends Book {
    private String ID;
    private Date borrowingDate, returnDate;

    public BorrowingBookInformation() {
    }

    public BorrowingBookInformation(String ISBN, String name, String author, String press, String type, float pricing, int number, int remaining, boolean borrow, Date date, String introduction, String ID, Date borrowingDate, Date returnDate) {
        super(ISBN, name, author, press, type, pricing, number, remaining, borrow, date, introduction);
        this.ID = ID;
        this.borrowingDate = borrowingDate;
        this.returnDate = returnDate;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
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
