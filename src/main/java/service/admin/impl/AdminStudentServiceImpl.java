package service.admin.impl;

import bean.Student;
import mapper.StudentMapper;
import org.apache.ibatis.session.RowBounds;
import service.admin.AdminStudentService;

import java.util.List;

public class AdminStudentServiceImpl implements AdminStudentService {

    private StudentMapper studentMapper;

    public void setStudentMapper(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    @Override
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
    public Student selectStudentByID(String ID) {
        return studentMapper.selectStudentByID(ID);
    }

    @Override
    public List<Student> selectStudent(Student student, boolean sexCheck, int offset, int limit) {
        RowBounds rowBounds = new RowBounds(offset, limit);
        return studentMapper.selectStudent(student, sexCheck, rowBounds);
    }

    @Override
    public int NumberOfStudent(Student student, boolean sexCheck) {
        return studentMapper.numberOfStudent(student, sexCheck);
    }
}
