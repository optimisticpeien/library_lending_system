package service.admin;

import entity.Book;

import java.util.List;
import java.util.Map;

public interface AdminBookService {

    boolean bookAdd(Book book);

    boolean bookDelete(String ID);

    boolean bookUpdate(Book book);

    Book selectBookByISBN(String ID);

    List<Book> selectBook(Book book, Map<String, Boolean> map, int offset, int limit);

    int NumberOfBook(Book book, Map<String, Boolean> map);
}
