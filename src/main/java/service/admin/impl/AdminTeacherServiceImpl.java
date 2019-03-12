package service.admin.impl;

import bean.Teacher;
import mapper.TeacherMapper;
import org.apache.ibatis.session.RowBounds;
import service.admin.AdminTeacherService;

import java.util.List;

public class AdminTeacherServiceImpl implements AdminTeacherService {

    private TeacherMapper teacherMapper;

    public void setTeacherMapper(TeacherMapper teacherMapper) {
        this.teacherMapper = teacherMapper;
    }

    @Override
    public boolean teacherAdd(Teacher teacher) {
        Teacher stu = teacherMapper.selectTeacherByID(teacher.getID());
        if (stu == null) {
            teacherMapper.addTeacher(teacher);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean teacherDelete(String ID) {
        Teacher stu = teacherMapper.selectTeacherByID(ID);
        if (stu != null) {
            teacherMapper.deleteTeacher(ID);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean teacherUpdate(Teacher teacher) {
        Teacher stu = teacherMapper.selectTeacherByID(teacher.getID());
        if (stu != null) {
            teacherMapper.updateTeacher(teacher);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Teacher selectTeacherByID(String ID) {
        return teacherMapper.selectTeacherByID(ID);
    }

    @Override
    public List<Teacher> selectTeacher(Teacher teacher, boolean sexCheck, int offset, int limit) {
        RowBounds rowBounds = new RowBounds(offset, limit);
        return teacherMapper.selectTeacher(teacher, sexCheck, rowBounds);
    }

    @Override
    public int NumberOfTeacher(Teacher teacher, boolean sexCheck) {
        return teacherMapper.numberOfTeacher(teacher, sexCheck);
    }
}
