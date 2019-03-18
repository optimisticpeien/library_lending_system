package service.admin.impl;

import bean.Book;
import mapper.BookMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.admin.AdminBookService;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class AdminBookServiceImpl implements AdminBookService {

    private BookMapper bookMapper;

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean bookAdd(Book book) {
        Book book1 = bookMapper.selectBookByISBN(book.getISBN());
        if (book1 == null) {
            book.setRemaining(book.getNumber());
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();
            book.setDate(date);
            bookMapper.addBook(book);
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean bookDelete(String ISBN) {
        Book book1 = bookMapper.selectBookByISBN(ISBN);
        if (book1 != null) {
            if (book1.getNumber() != book1.getRemaining())
                return false;
            bookMapper.deleteBook(ISBN);
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean bookUpdate(Book book) {
        Book book1 = bookMapper.selectBookByISBN(book.getISBN());
        if (book1 != null) {
            book.setRemaining(book.getNumber() - book1.getNumber() + book1.getRemaining());
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();
            book.setDate(date);
            bookMapper.updateBook(book);
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public Book selectBookByISBN(String ISBN) {
        return bookMapper.selectBookByISBN(ISBN);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public List<Book> selectBook(Book book, Map<String, Boolean> map, int offset, int limit) {
        RowBounds rowBounds = new RowBounds(offset, limit);
        return bookMapper.selectBook(book, map, rowBounds);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public int NumberOfBook(Book book, Map<String, Boolean> map) {
        return bookMapper.numberOfBook(book, map);
    }
}
