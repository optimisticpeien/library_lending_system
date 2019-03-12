package service.admin;

import bean.BorrowingBookInformation;

import java.util.List;

public interface AdminBorrowService {
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
    int borrowBook(String identity, String ID, String[] ISBNs);

    List<BorrowingBookInformation> select(String ID);

    void returnBook(String identity, String ID, String[] ISBNs);

    void renew(String identity, String ID, String[] ISBNs);
}
