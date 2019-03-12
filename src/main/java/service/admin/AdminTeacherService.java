package service.admin;

import bean.Teacher;

import java.util.List;

public interface AdminTeacherService {

    boolean teacherAdd(Teacher teacher);

    boolean teacherDelete(String ID);

    boolean teacherUpdate(Teacher teacher);

    Teacher selectTeacherByID(String ID);

    List<Teacher> selectTeacher(Teacher teacher, boolean sexCheck, int offset, int limit);

    int NumberOfTeacher(Teacher teacher, boolean sexCheck);
}
