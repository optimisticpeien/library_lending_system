package controller.root;

import entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.root.RootAdminService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("root/admin")
public class RootAdminController {
    private RootAdminService rootAdminService;

    @Autowired
    public void setRootAdminService(RootAdminService rootAdminService) {
        this.rootAdminService = rootAdminService;
    }

    @RequestMapping("add")
    public String adminAdd() {
        return "add";
    }

    @RequestMapping("change")
    public String adminChange(@RequestParam(value = "id", required = false) String id, Model model) {
        if (id != null) {
            model.addAttribute("admin", rootAdminService.selectAdminByID(id));
        }
        return "change";
    }

    @RequestMapping("select")
    public String adminSelect() {
        return "select";
    }

    @ResponseBody
    @RequestMapping(value = "addAdmin", method = RequestMethod.POST)
    public Map<String, String> addAdmin(Admin admin, @RequestParam("pwdagain") String pwdagain) {
        Map<String, String> map = new HashMap<>();
        if (!admin.getPassword().equals(pwdagain)) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "两次输入密码不一致！");
        } else {
            if (rootAdminService.addAdmin(admin)) {
                map.put("modalTitle", "成功");
                map.put("modalPoint", "添加管理员账户成功！");
            } else {
                map.put("modalTitle", "错误");
                map.put("modalPoint", "已经存在此工号的管理员！");
            }
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "changeAdmin/select", method = RequestMethod.POST)
    public Map<String, Object> changeSelect(@RequestParam("ID") String ID) {
        Map<String, Object> map = new HashMap<>();
        if (ID.equals("root")) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "禁止修改超级管理员！");
            return map;
        }
        Admin admin = rootAdminService.selectAdminByID(ID);
        if (admin == null) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有找到相关管理员信息！");
        } else {
            map.put("modalTitle", "成功");
            map.put("name", admin.getName());
            map.put("password", admin.getPassword());
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "changeAdmin", method = RequestMethod.POST)
    public Map<String, String> changeAdmin(Admin admin, @RequestParam("pwdagain") String pwdagain) {
        Map<String, String> map = new HashMap<>();
        if (!admin.getPassword().equals(pwdagain)) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "两次输入密码不一致！");
        } else if (admin.getID().equals("root")) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "禁止修改超级管理员！");
        } else {
            if (rootAdminService.updateAdmin(admin)) {
                map.put("modalTitle", "成功");
                map.put("modalPoint", "修改管理员账户成功！");
            } else {
                map.put("modalTitle", "错误");
                map.put("modalPoint", "没有找到此管理员！");
            }
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "deleteAdmin", method = RequestMethod.POST)
    public Map<String, String> deleteAdmin(@RequestParam("ID") String ID) {
        Map<String, String> map = new HashMap<>();
        if (ID.equals("")) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有填写管理员号！");
        } else if (ID.equals("root")) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "禁止删除超级管理员！");
        } else {
            if (rootAdminService.deleteAdmin(ID)) {
                map.put("modalTitle", "成功");
                map.put("modalPoint", "删除管理员账户成功！");
            } else {
                map.put("modalTitle", "错误");
                map.put("modalPoint", "没有找到此管理员！");
            }
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "selectAdmin")
    public Map<String, Object> selectAdmin(@RequestParam("ID") String ID,
                                           @RequestParam("name") String name,
                                           @RequestParam("page") int page,
                                           @RequestParam("limit") int limit) {
        int offset = (page - 1) * limit;
        List<Admin> admins = rootAdminService.selectAdmin(ID, name, offset, limit);
        int adminNumber = rootAdminService.NumberOfAdmin(ID, name);
        int pageNumber = adminNumber % limit == 0 ? adminNumber / limit : adminNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("admins", admins);
        map.put("adminNumber", adminNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }
}
