package controller.root;

import entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.root.RootService;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("root")
public class RootController {

    private RootService rootService;

    @Autowired
    public void setRootService(RootService rootService) {
        this.rootService = rootService;
    }

    @RequestMapping("root")
    public String root(HttpSession session) {
        Map map = rootService.jmpRoot();
        session.setAttribute("adminNumber", map.get("adminNumber"));
        session.setAttribute("teacherNumber", map.get("teacherNumber"));
        session.setAttribute("studentNumber", map.get("studentNumber"));
        session.setAttribute("sum", map.get("sum"));
        session.setAttribute("userNumber", map.get("userNumber"));
        return "root";
    }

    @RequestMapping("password")
    public String password() {
        return "password";
    }

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
            rootService.changePassword(((Admin) session.getAttribute("user")).getID(), newpwd);
            modelAndView.addObject("success", "密码修改成功，请重新登录！");
            modelAndView.addObject("back", "index");
            modelAndView.setViewName("../point/success");
        }
        return modelAndView;
    }
}
