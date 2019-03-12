package mapper;


import bean.Student;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface StudentMapper {
    Student selectStudentByID(String ID);

    List<Student> selectStudent(@Param("student") Student student, @Param("sexCheck") boolean sexCheck, RowBounds rowBounds);

    int numberOfStudent(@Param("student") Student student, @Param("sexCheck") boolean sexCheck);

    int numberOfAllStudent();

    void addStudent(Student student);

    void deleteStudent(String ID);

    void updateStudent(Student student);

    void updateBookNumber(@Param("ID") String ID, @Param("borrow") boolean borrow, @Param("number") int number);

    void changePassword(@Param("ID") String ID, @Param("password") String password);
}
