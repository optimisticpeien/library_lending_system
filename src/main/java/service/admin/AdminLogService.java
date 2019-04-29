package service.admin;

import entity.BorrowingBookInformation;
import entity.BorrowingInformation;

import java.util.List;

public interface AdminLogService {
    List<BorrowingInformation> overdue(int offset, int limit);

    int NumberOfOverdue();

    List<BorrowingBookInformation> borrowingRecord(String ID, int offset, int limit);

    int NumberOfLog(String ID);
}
