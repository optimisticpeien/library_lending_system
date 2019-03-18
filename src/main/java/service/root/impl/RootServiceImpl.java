package service.root.impl;

import listener.OnlineUsers;
import mapper.AdminMapper;
import mapper.StudentMapper;
import mapper.TeacherMapper;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.root.RootService;

import java.util.HashMap;
import java.util.Map;

public class RootServiceImpl implements RootService {
    private AdminMapper adminMapper;
    private TeacherMapper teacherMapper;
    private StudentMapper studentMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    public void setTeacherMapper(TeacherMapper teacherMapper) {
        this.teacherMapper = teacherMapper;
    }

    public void setStudentMapper(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public Map<String, Object> jmpRoot() {
        Map<String, Object> map = new HashMap<>();
        map.put("adminNumber", adminMapper.numberOfAdmin("", ""));
        map.put("teacherNumber", teacherMapper.numberOfAllTeacher());
        map.put("studentNumber", studentMapper.numberOfAllStudent());
        map.put("sum", OnlineUsers.getSum());
        map.put("userNumber", OnlineUsers.getUserNumber());
        return map;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public void changePassword(String ID, String password) {
        adminMapper.changePassword(ID, password);
    }
}
