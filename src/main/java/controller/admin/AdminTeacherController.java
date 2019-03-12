package controller.admin;

import bean.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.admin.AdminTeacherService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/teacher")
public class AdminTeacherController {

    private AdminTeacherService adminTeacherService;

    @Autowired
    public void setAdminTeacherService(AdminTeacherService adminTeacherService) {
        this.adminTeacherService = adminTeacherService;
    }

    @RequestMapping("add")
    public String teacherAdd() {
        return "add";
    }

    @RequestMapping("change")
    public String teacherChange(@RequestParam(value = "id", required = false) String id, Model model) {
        if (id != null) {
            model.addAttribute("teacher", adminTeacherService.selectTeacherByID(id));
        }
        return "change";
    }

    @RequestMapping("delete")
    public String teacherDelete() {
        return "delete";
    }

    @RequestMapping("select")
    public String teacherSelect() {
        return "select";
    }

    @ResponseBody
    @RequestMapping("addTeacher")
    public Map<String, String> addTeacher(Teacher teacher) {
        Map<String, String> map = new HashMap<>();
        if (adminTeacherService.teacherAdd(teacher)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "添加教师账户成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "已经存在此工号的教师！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("updateTeacher")
    public Map<String, String> updateTeacher(Teacher teacher) {
        Map<String, String> map = new HashMap<>();
        if (adminTeacherService.teacherUpdate(teacher)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "修改教师账户成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有此工号的教师！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("deleteTeacher")
    public Map<String, String> deleteTeacher(String ID) {
        Map<String, String> map = new HashMap<>();
        if (adminTeacherService.teacherDelete(ID)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "删除教师账户成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有此工号的教师！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "changeTeacher/select", method = RequestMethod.POST)
    public Map<String, Object> changeSelect(@RequestParam("ID") String ID) {
        Map<String, Object> map = new HashMap<>();
        Teacher teacher = adminTeacherService.selectTeacherByID(ID);
        if (teacher == null) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有找到相关教师信息！");
        } else {
            map.put("modalTitle", "成功");
            map.put("teacher", teacher);
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "selectTeacher")
    public Map<String, Object> selectTeacher(Teacher teacher,
                                             @RequestParam("sexCheck") boolean sexCheck,
                                             @RequestParam("page") int page,
                                             @RequestParam("limit") int limit) {
        int offset = (page - 1) * limit;
        List<Teacher> teachers = adminTeacherService.selectTeacher(teacher, sexCheck, offset, limit);
        int teacherNumber = adminTeacherService.NumberOfTeacher(teacher, sexCheck);
        int pageNumber = teacherNumber % limit == 0 ? teacherNumber / limit : teacherNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("teachers", teachers);
        map.put("teacherNumber", teacherNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }
}
