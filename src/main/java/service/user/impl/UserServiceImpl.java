package service.user.impl;

import bean.Book;
import bean.BorrowedBook;
import bean.BorrowingBookInformation;
import mapper.*;
import org.apache.ibatis.session.RowBounds;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.user.UserService;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {

    private BorrowingLogMapper borrowingLogMapper;
    private BorrowedBookMapper borrowedBookMapper;
    private BookMapper bookMapper;
    private StudentMapper studentMapper;
    private TeacherMapper teacherMapper;

    public void setBorrowingLogMapper(BorrowingLogMapper borrowingLogMapper) {
        this.borrowingLogMapper = borrowingLogMapper;
    }

    public void setBorrowedBookMapper(BorrowedBookMapper borrowedBookMapper) {
        this.borrowedBookMapper = borrowedBookMapper;
    }

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    public void setStudentMapper(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    public void setTeacherMapper(TeacherMapper teacherMapper) {
        this.teacherMapper = teacherMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public List<BorrowingBookInformation> borrowingRecord(String ID, int offset, int limit) {
        List<BorrowingBookInformation> borrowing = borrowingLogMapper.select(ID);
        int l = offset + limit > borrowing.size() ? borrowing.size() : offset + limit;
        return borrowing.subList(offset, l);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public int NumberOfLog(String ID) {
        return borrowingLogMapper.borrowNumber(ID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public List<BorrowingBookInformation> selectBorrowed(String ID) {
        return borrowedBookMapper.select(ID);
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean renew(String identity, String ID, String[] ISBNs) {
        int date = 0, l = 0;
        if (identity.equals("student")) {
            date = 15;
            l = 36;
        }
        if (identity.equals("teacher")) {
            date = 30;
            l = 91;
        }
        for (String ISBN : ISBNs) {
            BorrowedBook borrowedBook = borrowedBookMapper.renewSelect(ID, ISBN);
            Calendar borrowingDate = Calendar.getInstance();
            borrowingDate.setTime(borrowedBook.getBorrowingDate());
            borrowingDate.add(Calendar.DAY_OF_YEAR, l);
            Calendar returnDate = Calendar.getInstance();
            returnDate.setTime(borrowedBook.getReturnDate());
            if (borrowingDate.before(returnDate)) {
                return false;
            } else
                borrowedBookMapper.renew(ID, ISBN, date);
        }
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public List<Book> selectBook(Book book, int offset, int limit) {
        Map<String, Boolean> map = new HashMap<>();
        map.put("pricingCheck", false);
        map.put("numberCheck", false);
        map.put("borrowCheck", false);
        RowBounds rowBounds = new RowBounds(offset, limit);
        return bookMapper.selectBook(book, map, rowBounds);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public int NumberOfBook(Book book) {
        Map<String, Boolean> map = new HashMap<>();
        map.put("pricingCheck", false);
        map.put("numberCheck", false);
        map.put("borrowCheck", false);
        return bookMapper.numberOfBook(book, map);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public Book selectBookByISBN(String ISBN) {
        return bookMapper.selectBookByISBN(ISBN);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public void changePassword(String identity, String ID, String password) {
        if (identity.equals("student"))
            studentMapper.changePassword(ID, password);
        else if (identity.equals("teacher")) {
            teacherMapper.changePassword(ID, password);
        }
    }
}
