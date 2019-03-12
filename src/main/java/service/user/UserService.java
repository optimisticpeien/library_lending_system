package service.user;

import bean.Book;
import bean.BorrowingBookInformation;

import java.util.List;

public interface UserService {

    List<BorrowingBookInformation> borrowingRecord(String ID, int offset, int limit);

    int NumberOfLog(String ID);

    List<BorrowingBookInformation> selectBorrowed(String ID);

    boolean renew(String identity, String ID, String[] ISBNs);

    List<Book> selectBook(Book book, int offset, int limit);

    int NumberOfBook(Book book);

    Book selectBookByISBN(String ID);

    void changePassword(String identity, String ID, String password);
}
