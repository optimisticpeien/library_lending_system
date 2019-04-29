package mapper;

import entity.Book;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

public interface BookMapper {
    Book selectBookByISBN(String ISBN);

    List<Book> selectBook(@Param("book") Book book, @Param("map") Map<String, Boolean> map, RowBounds rowBounds);

    int numberOfBook(@Param("book") Book book, @Param("map") Map<String, Boolean> map);

    void addBook(Book book);

    void deleteBook(String ISBN);

    void updateBook(Book book);

    void updateRemaining(@Param("ISBN") String ISBN, @Param("borrow") boolean borrow);

    int numberOfAllBook();

    List<Book> selectLast();
}
