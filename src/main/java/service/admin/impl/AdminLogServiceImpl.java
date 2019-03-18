package service.admin.impl;

import bean.BorrowingBookInformation;
import bean.BorrowingInformation;
import bean.Student;
import bean.Teacher;
import mapper.BorrowedBookMapper;
import mapper.BorrowingLogMapper;
import mapper.StudentMapper;
import mapper.TeacherMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.admin.AdminLogService;

import java.util.List;

public class AdminLogServiceImpl implements AdminLogService {
    private BorrowedBookMapper borrowedBookMapper;
    private BorrowingLogMapper borrowingLogMapper;
    private TeacherMapper teacherMapper;
    private StudentMapper studentMapper;

    public void setBorrowedBookMapper(BorrowedBookMapper borrowedBookMapper) {
        this.borrowedBookMapper = borrowedBookMapper;
    }

    public void setBorrowingLogMapper(BorrowingLogMapper borrowingLogMapper) {
        this.borrowingLogMapper = borrowingLogMapper;
    }

    public void setTeacherMapper(TeacherMapper teacherMapper) {
        this.teacherMapper = teacherMapper;
    }

    public void setStudentMapper(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public List<BorrowingInformation> overdue(int offset, int limit) {
        RowBounds rowBounds = new RowBounds(offset, limit);
        List<BorrowingInformation> borrowingInformations = borrowedBookMapper.overdue(rowBounds);
        for (BorrowingInformation borrowingInformation : borrowingInformations) {
            Student student = studentMapper.selectStudentByID(borrowingInformation.getID());
            if (student != null) {
                borrowingInformation.setPeopleName(student.getName());
                break;
            }
            Teacher teacher = teacherMapper.selectTeacherByID(borrowingInformation.getID());
            if (teacher != null) {
                borrowingInformation.setPeopleName(teacher.getName());
            }
        }
        return borrowingInformations;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public int NumberOfOverdue() {
        return borrowedBookMapper.overdueNumber();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public List<BorrowingBookInformation> borrowingRecord(String ID, int offset, int limit) {
        List<BorrowingBookInformation> borrowing = borrowedBookMapper.select(ID);
        borrowing.addAll(borrowingLogMapper.select(ID));
        int l = offset + limit > borrowing.size() ? borrowing.size() : offset + limit;
        return borrowing.subList(offset, l);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public int NumberOfLog(String ID) {
        int number = borrowedBookMapper.borrowNumber(ID);
        number += borrowingLogMapper.borrowNumber(ID);
        return number;
    }
}
