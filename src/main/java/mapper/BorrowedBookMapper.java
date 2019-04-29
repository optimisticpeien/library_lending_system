package mapper;

import entity.BorrowedBook;
import entity.BorrowingBookInformation;
import entity.BorrowingInformation;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface BorrowedBookMapper {
    List<BorrowingBookInformation> select(String ID);

    int borrowNumber(String ID);

    void borrowBook(BorrowedBook borrowedBook);

    void returnBook(@Param("ID") String ID, @Param("ISBNs") String[] ISBNs);

    boolean repeatedBorrowing(@Param("ID") String ID, @Param("ISBN") String ISBN);

    void renew(@Param("ID") String ID, @Param("ISBN") String ISBN, @Param("date") int date);

    BorrowedBook renewSelect(@Param("ID") String ID, @Param("ISBN") String ISBN);

    List<BorrowingInformation> overdue(RowBounds rowBounds);

    int overdueNumber();
}
