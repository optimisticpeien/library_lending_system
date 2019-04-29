package serviceImpl.admin;

import entity.Student;
import mapper.StudentMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.admin.AdminStudentService;

import java.util.List;

public class AdminStudentServiceImpl implements AdminStudentService {

    private StudentMapper studentMapper;

    public void setStudentMapper(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean studentAdd(Student student) {
        Student stu = studentMapper.selectStudentByID(student.getID());
        if (stu == null) {
            studentMapper.addStudent(student);
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean studentDelete(String ID) {
        Student stu = studentMapper.selectStudentByID(ID);
        if (stu != null) {
            studentMapper.deleteStudent(ID);
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean studentUpdate(Student student) {
        Student stu = studentMapper.selectStudentByID(student.getID());
        if (stu != null) {
            studentMapper.updateStudent(student);
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public Student selectStudentByID(String ID) {
        return studentMapper.selectStudentByID(ID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public List<Student> selectStudent(Student student, boolean sexCheck, int offset, int limit) {
        RowBounds rowBounds = new RowBounds(offset, limit);
        return studentMapper.selectStudent(student, sexCheck, rowBounds);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public int NumberOfStudent(Student student, boolean sexCheck) {
        return studentMapper.numberOfStudent(student, sexCheck);
    }
}
