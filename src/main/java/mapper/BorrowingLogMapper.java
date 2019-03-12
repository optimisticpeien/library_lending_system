package mapper;

import bean.BorrowedBook;
import bean.BorrowingBookInformation;

import java.util.List;

public interface BorrowingLogMapper {
    List<BorrowingBookInformation> select(String ID);

    int borrowNumber(String ID);

    void logging(BorrowedBook borrowedBook);
}
