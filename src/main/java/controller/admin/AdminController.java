package controller.admin;

import entity.Admin;
import entity.BorrowingBookInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.admin.AdminBorrowService;
import service.admin.AdminService;
import service.admin.AdminStudentService;
import service.admin.AdminTeacherService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class AdminController {

    private AdminBorrowService adminBorrowService;
    private AdminService adminService;
    private AdminStudentService adminStudentService;
    private AdminTeacherService adminTeacherService;

    @Autowired
    public void setAdminBorrowService(AdminBorrowService adminBorrowService) {
        this.adminBorrowService = adminBorrowService;
    }

    @Autowired
    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    @Autowired
    public void setAdminStudentService(AdminStudentService adminStudentService) {
        this.adminStudentService = adminStudentService;
    }

    @Autowired
    public void setAdminTeacherService(AdminTeacherService adminTeacherService) {
        this.adminTeacherService = adminTeacherService;
    }

    @RequestMapping("admin")
    public String admin() {
        return "admin";
    }

    @RequestMapping("adminBorrow")
    public String adminBorrow() {
        return "adminBorrow";
    }

    @RequestMapping("adminReturn")
    public String adminReturn() {
        return "adminReturn";
    }

    @RequestMapping("password")
    public String password() {
        return "password";
    }

    @ResponseBody
    @RequestMapping(value = "changePassword", method = RequestMethod.POST)
    public ModelAndView changePassword(@RequestParam("oldpwd") String oldpwd,
                                       @RequestParam("newpwd") String newpwd,
                                       @RequestParam("pwdagain") String pwdagain,
                                       HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        if (!((Admin) session.getAttribute("user")).getPassword().equals(oldpwd)) {
            modelAndView.addObject("error", "原密码不正确！");
            modelAndView.addObject("back", "password");
            modelAndView.setViewName("../point/error");
        } else if (!newpwd.equals(pwdagain)) {
            modelAndView.addObject("error", "两次输入密码不一致！");
            modelAndView.addObject("back", "password");
            modelAndView.setViewName("../point/error");
        } else if (((Admin) session.getAttribute("user")).getPassword().equals(oldpwd)) {
            adminService.changePassword(((Admin) session.getAttribute("user")).getID(), newpwd);
            modelAndView.addObject("success", "密码修改成功，请重新登录！");
            modelAndView.addObject("back", "index");
            modelAndView.setViewName("../point/success");
        }
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("borrowBooks")
    public Map borrowBooks(@RequestParam("identity") String identity,
                           @RequestParam("ID") String ID,
                           @RequestParam("isbns") String[] isbns) {
        int point = adminBorrowService.borrowBook(identity, ID, isbns);
        Map<String, String> map = new HashMap<>();
        switch (point) {
            case 1:
                map.put("modalTitle", "成功");
                map.put("modalPoint", "借书成功！");
                break;
            case 0:
                map.put("modalTitle", "错误");
                map.put("modalPoint", "身份错误！");
                break;
            case -1:
                map.put("modalTitle", "错误");
                map.put("modalPoint", "没有此图书！");
                break;
            case -2:
                map.put("modalTitle", "错误");
                map.put("modalPoint", "没有此学生！");
                break;
            case -3:
                map.put("modalTitle", "错误");
                map.put("modalPoint", "没有此教师！");
                break;
            case -4:
                map.put("modalTitle", "失败");
                map.put("modalPoint", "超出可借本数！");
                break;
            case -5:
                map.put("modalTitle", "失败");
                map.put("modalPoint", "超出剩余本数，请核对信息！");
                break;
            case -6:
                map.put("modalTitle", "失败");
                map.put("modalPoint", "此账户已借阅相关书籍，不可重复借阅！");
                break;
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("selectBorrowBooks")
    public List<BorrowingBookInformation> selectBorrowBooks(@RequestParam("ID") String ID) {
        return adminBorrowService.select(ID);
    }

    @ResponseBody
    @RequestMapping("borrowOrRenewBook")
    public Map borrowOrRenewBook(@RequestParam("identity") String identity,
                                 @RequestParam("ID") String ID,
                                 @RequestParam(value = "returnBooks", required = false) String[] returnBooks,
                                 @RequestParam(value = "renewBooks", required = false) String[] renewBooks) {

        Map<String, String> map = new HashMap();
        if (identity.equals("student")) {
            if (adminStudentService.selectStudentByID(ID) == null) {
                map.put("modalTitle", "错误");
                map.put("modalPoint", "没有此学号学生！");
                return map;
            }
        } else if (identity.equals("teacher")) {
            if (adminTeacherService.selectTeacherByID(ID) == null) {
                map.put("modalTitle", "错误");
                map.put("modalPoint", "没有此工号教师！");
                return map;
            }
        }
        if (returnBooks != null) {
            adminBorrowService.returnBook(identity, ID, returnBooks);
        }
        if (renewBooks != null) {
            adminBorrowService.renew(identity, ID, renewBooks);
        }
        map.put("modalTitle", "成功");
        map.put("modalPoint", "操作成功！");
        return map;
    }
}