package service.admin;

import bean.Student;

import java.util.List;

public interface AdminStudentService {

    boolean studentAdd(Student student);

    boolean studentDelete(String ID);

    boolean studentUpdate(Student student);

    Student selectStudentByID(String ID);

    List<Student> selectStudent(Student student, boolean sexCheck, int offset, int limit);

    int NumberOfStudent(Student student, boolean sexCheck);
}
