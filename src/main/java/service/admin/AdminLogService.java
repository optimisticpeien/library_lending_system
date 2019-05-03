package service.admin;

import entity.BorrowingBookInformation;
import entity.BorrowingInformation;

import java.util.List;

public interface AdminLogService {
    List<BorrowingInformation> overdue(int offset, int limit);

    int NumberOfOverdue();

    List<BorrowingBookInformation> borrowing(String ID, int offset, int limit);

    List<BorrowingBookInformation> borrowed(String ID, int offset, int limit);

    int NumberOfBorrowed(String ID);

    int NumberOfBorrowing(String ID);
}
