package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import service.LoginService;

import java.util.Date;
import java.util.Map;

@Controller
@SessionAttributes({"identity", "user", "borrowedBooks", "books", "adminNumber", "teacherNumber", "studentNumber", "lastDate"})
public class LoginController {

    private final LoginService loginService;

    @Autowired
    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @RequestMapping(value = "main", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("ID") String id,
                              @RequestParam("identity") String identity,
                              @RequestParam("password") String password) {
        Map map = loginService.login(id, identity, password);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("identity", map.get("identity"));

        if (map.get("identity").equals("student") || (map.get("identity").equals("teacher"))) {
            modelAndView.addObject("user", map.get("user"));
            modelAndView.addObject("borrowedBooks", map.get("borrowedBooks"));
            modelAndView.addObject("books", map.get("books"));
            modelAndView.setViewName("redirect:user/user");
        } else if (map.get("identity").equals("admin")) {
            modelAndView.addObject("user", map.get("user"));
            modelAndView.addObject("adminNumber", map.get("adminNumber"));
            modelAndView.addObject("teacherNumber", map.get("teacherNumber"));
            modelAndView.addObject("studentNumber", map.get("studentNumber"));
            modelAndView.addObject("lastDate", new Date());
            modelAndView.setViewName("redirect:admin/admin");
        } else if (map.get("identity").equals("root")) {
            modelAndView.addObject("user", map.get("user"));
            modelAndView.addObject("adminNumber", map.get("adminNumber"));
            modelAndView.addObject("teacherNumber", map.get("teacherNumber"));
            modelAndView.addObject("studentNumber", map.get("studentNumber"));
            modelAndView.addObject("lastDate", new Date());
            modelAndView.setViewName("redirect:root/root");
        } else if (map.get("identity").equals("error")) {
            modelAndView.addObject("error", map.get("error"));
            modelAndView.addObject("back", "index");
            modelAndView.setViewName("point/error");
        }
        return modelAndView;
    }
}
