package mapper;

import entity.BorrowedBook;
import entity.BorrowingBookInformation;

import java.util.List;

public interface BorrowingLogMapper {
    List<BorrowingBookInformation> select(String ID);

    int borrowNumber(String ID);

    void logging(BorrowedBook borrowedBook);
}
