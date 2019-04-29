package serviceImpl.admin;

import entity.*;
import mapper.*;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.admin.AdminBorrowService;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class AdminBorrowServiceImpl implements AdminBorrowService {

    private StudentMapper studentMapper;
    private TeacherMapper teacherMapper;
    private BorrowedBookMapper borrowedBookMapper;
    private BorrowingLogMapper borrowingLogMapper;
    private BookMapper bookMapper;

    public void setStudentMapper(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    public void setTeacherMapper(TeacherMapper teacherMapper) {
        this.teacherMapper = teacherMapper;
    }

    public void setBorrowedBookMapper(BorrowedBookMapper borrowedBookMapper) {
        this.borrowedBookMapper = borrowedBookMapper;
    }

    public void setBorrowingLogMapper(BorrowingLogMapper borrowingLogMapper) {
        this.borrowingLogMapper = borrowingLogMapper;
    }

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    /**
     * @param identity 身份
     * @param ID       学号、教师工号
     * @param ISBNs    图书编号数组
     * @return 1：借阅成功
     * 0：身份错误
     * -1：没有此图书
     * -2：没有此学生
     * -3：没有此教师
     * -4：超出可借本数
     * -5：超出剩余本数
     * -6：重复借书
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public int borrowBook(String identity, String ID, String[] ISBNs) {
        int duration = 0;
        int bookNumber = ISBNs.length;
        Book book;
        for (String isbn : ISBNs) {
            book = bookMapper.selectBookByISBN(isbn);
            if (book == null) {
                return -1;
            }
            if (book.getRemaining() - bookNumber < 0) {
                return -5;
            }
            if (borrowedBookMapper.repeatedBorrowing(ID, isbn)) {
                return -6;
            }
        }
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        if (identity.equals("student")) {
            Student student = studentMapper.selectStudentByID(ID);
            if (student == null) {
                return -2;
            }
            if (student.getBookNumber() - bookNumber < 0) {
                return -4;
            }
            duration = 30;
        } else if (identity.equals("teacher")) {
            Teacher teacher = teacherMapper.selectTeacherByID(ID);
            if (teacher == null) {
                return -3;
            }
            if (teacher.getBookNumber() - bookNumber < 0) {
                return -4;
            }
            duration = 60;

        }
        calendar.add(Calendar.DAY_OF_YEAR, duration);
        Date returnDate = calendar.getTime();
        for (String isbn : ISBNs) {
            BorrowedBook borrowedBook = new BorrowedBook(ID, isbn, date, returnDate);
            borrowedBookMapper.borrowBook(borrowedBook);
            bookMapper.updateRemaining(isbn, true);
        }
        if (identity.equals("student")) {
            studentMapper.updateBookNumber(ID, true, bookNumber);
            return 1;
        }
        if (identity.equals("teacher")) {
            teacherMapper.updateBookNumber(ID, true, bookNumber);
            return 1;
        }
        return 0;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public List<BorrowingBookInformation> select(String ID) {
        return borrowedBookMapper.select(ID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public void returnBook(String identity, String ID, String[] ISBNs) {
        Calendar calendar = Calendar.getInstance();
        Date returnDate = calendar.getTime();
        List<BorrowingBookInformation> borrowingBookInformations = borrowedBookMapper.select(ID);
        for (BorrowingBookInformation borrowingBookInformation : borrowingBookInformations) {
            for (String ISBN : ISBNs) {
                if (ISBN.equals(borrowingBookInformation.getISBN())) {
                    BorrowedBook borrowedBook = new BorrowedBook(ID, ISBN, borrowingBookInformation.getBorrowingDate(), returnDate);
                    borrowingLogMapper.logging(borrowedBook);
                    bookMapper.updateRemaining(ISBN, false);
                }
            }
        }
        borrowedBookMapper.returnBook(ID, ISBNs);
        int number = ISBNs.length;
        if (identity.equals("student")) {
            studentMapper.updateBookNumber(ID, false, number);
        }
        if (identity.equals("teacher")) {
            teacherMapper.updateBookNumber(ID, false, number);
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public void renew(String identity, String ID, String[] ISBNs) {
        int date = 0;
        if (identity.equals("student")) {
            date = 15;
        }
        if (identity.equals("teacher")) {
            date = 30;
        }
        for (String ISBN : ISBNs) {
            borrowedBookMapper.renew(ID, ISBN, date);
        }
    }
}
