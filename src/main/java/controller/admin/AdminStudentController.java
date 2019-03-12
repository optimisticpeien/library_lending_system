package controller.admin;

import bean.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.admin.AdminStudentService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/student")
public class AdminStudentController {

    private AdminStudentService adminStudentService;

    @Autowired
    public void setAdminStudentService(AdminStudentService adminStudentService) {
        this.adminStudentService = adminStudentService;
    }

    @RequestMapping("add")
    public String add() {
        return "add";
    }

    @RequestMapping("change")
    public String change(@RequestParam(value = "id", required = false) String id, Model model) {
        if (id != null) {
            model.addAttribute("student", adminStudentService.selectStudentByID(id));
        }
        return "change";
    }

    @RequestMapping("delete")
    public String delete() {
        return "delete";
    }

    @RequestMapping("select")
    public String select() {
        return "select";
    }

    @ResponseBody
    @RequestMapping("addStudent")
    public Map<String, String> addStudent(Student student) {
        Map<String, String> map = new HashMap<>();
        if (adminStudentService.studentAdd(student)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "添加学生账户成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "已经存在此学号的学生！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("updateStudent")
    public Map<String, String> updateStudent(Student student) {
        Map<String, String> map = new HashMap<>();
        if (adminStudentService.studentUpdate(student)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "修改学生账户成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有此学号的学生！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("deleteStudent")
    public Map<String, String> deleteStudent(String ID) {
        Map<String, String> map = new HashMap<>();
        if (adminStudentService.studentDelete(ID)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "删除学生账户成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有此学号的学生！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "changeStudent/select", method = RequestMethod.POST)
    public Map<String, Object> changeSelect(@RequestParam("ID") String ID) {
        Map<String, Object> map = new HashMap<>();
        Student student = adminStudentService.selectStudentByID(ID);
        if (student == null) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有找到相关学生信息！");
        } else {
            map.put("modalTitle", "成功");
            map.put("student", student);
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "selectStudent")
    public Map<String, Object> selectStudent(Student student,
                                             @RequestParam("sexCheck") boolean sexCheck,
                                             @RequestParam("page") int page,
                                             @RequestParam("limit") int limit) {
        int offset = (page - 1) * limit;
        List<Student> students = adminStudentService.selectStudent(student, sexCheck, offset, limit);
        int studentNumber = adminStudentService.NumberOfStudent(student, sexCheck);
        int pageNumber = studentNumber % limit == 0 ? studentNumber / limit : studentNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("students", students);
        map.put("studentNumber", studentNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }
}
