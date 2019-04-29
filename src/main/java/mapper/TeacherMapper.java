package mapper;


import entity.Teacher;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface TeacherMapper {
    Teacher selectTeacherByID(String ID);

    List<Teacher> selectTeacher(@Param("teacher") Teacher teacher, @Param("sexCheck") boolean sexCheck, RowBounds rowBounds);

    int numberOfTeacher(@Param("teacher") Teacher teacher, @Param("sexCheck") boolean sexCheck);

    int numberOfAllTeacher();

    void addTeacher(Teacher teacher);

    void deleteTeacher(String ID);

    void updateTeacher(Teacher teacher);

    void updateBookNumber(@Param("ID") String ID, @Param("borrow") boolean borrow, @Param("number") int number);

    void changePassword(@Param("ID") String ID, @Param("password") String password);

}