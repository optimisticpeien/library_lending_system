package service.impl;

import bean.*;
import mapper.*;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.LoginService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LoginServiceImpl implements LoginService {

    private AdminMapper adminMapper;
    private TeacherMapper teacherMapper;
    private StudentMapper studentMapper;
    private BorrowedBookMapper borrowedBookMapper;
    private BookMapper bookMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    public void setTeacherMapper(TeacherMapper teacherMapper) {
        this.teacherMapper = teacherMapper;
    }

    public void setStudentMapper(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    public void setBorrowedBookMapper(BorrowedBookMapper borrowedBookMapper) {
        this.borrowedBookMapper = borrowedBookMapper;
    }

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public Map<String, Object> login(String ID, String identity, String password) {
        Map<String, Object> map = new HashMap<>();
        List<BorrowingBookInformation> borrowedBooks;
        List<Book> books;
        switch (identity) {
            case "student":
                Student student = studentMapper.selectStudentByID(ID);
                borrowedBooks = borrowedBookMapper.select(ID);
                books = bookMapper.selectLast();
                if (student != null && password.equals(student.getPassword())) {
                    map.put("identity", "student");
                    map.put("user", student);
                    map.put("borrowedBooks", borrowedBooks);
                    map.put("books", books);
                    return map;
                }
                map.put("identity", "error");
                map.put("error", "学生证号或密码不正确，请重新输入！");
                return map;
            case "teacher":
                Teacher teacher = teacherMapper.selectTeacherByID(ID);
                borrowedBooks = borrowedBookMapper.select(ID);
                books = bookMapper.selectLast();
                if (teacher != null && password.equals(teacher.getPassword())) {
                    map.put("identity", "teacher");
                    map.put("user", teacher);
                    map.put("borrowedBooks", borrowedBooks);
                    map.put("books", books);
                    return map;
                }
                map.put("identity", "error");
                map.put("error", "教师工号或密码不正确，请重新输入！");
                return map;
            case "admin":
                Admin admin = adminMapper.selectAdminByID(ID);
                if (admin != null && password.equals(admin.getPassword())) {
                    if (admin.getID().equals("root")) {
                        map.put("adminNumber", adminMapper.numberOfAdmin("", ""));
                        map.put("teacherNumber", teacherMapper.numberOfAllTeacher());
                        map.put("studentNumber", studentMapper.numberOfAllStudent());
                        map.put("identity", "root");
                        map.put("user", admin);
                        return map;
                    }
                    map.put("identity", "admin");
                    map.put("user", admin);
                    return map;
                }
                map.put("identity", "error");
                map.put("error", "管理员号或密码不正确，请重新输入！");
                return map;
            default:
                map.put("identity", "error");
                map.put("error", "类型异常，请重新输入！");
                return map;
        }
    }
}
