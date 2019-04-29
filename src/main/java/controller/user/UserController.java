package controller.user;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.user.UserService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "user")
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("user")
    public String user(HttpSession session) {
        session.getAttribute("user");
        return "user";
    }

    @RequestMapping("borrow")
    public String borrow() {
        return "borrow";
    }

    @RequestMapping("borrowedBooks")
    public String borrowedBooks() {
        return "borrowedBooks";
    }

    @RequestMapping("renew")
    public String renew() {
        return "renew";
    }

    @RequestMapping("books")
    public String books() {
        return "books";
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
            userService.changePassword((String) session.getAttribute("identity"), ((Admin) session.getAttribute("user")).getID(), newpwd);
            modelAndView.addObject("success", "密码修改成功，请重新登录！");
            modelAndView.addObject("back", "index");
            modelAndView.setViewName("../point/success");
        }
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("borrowingLog")
    public Map<String, Object> borrowingLog(@RequestParam("page") int page, @RequestParam("limit") int limit, HttpSession session) {
        String identity = (String) session.getAttribute("identity");
        Admin user = null;
        if (identity.equals("student")) {
            user = (Student) session.getAttribute("user");
        } else if (identity.equals("teacher")) {
            user = (Teacher) session.getAttribute("user");
        }
        int offset = (page - 1) * limit;
        List<BorrowingBookInformation> borrowing = userService.borrowingRecord(user.getID(), offset, limit);
        int borrowingNumber = userService.NumberOfLog(user.getID());
        int pageNumber = borrowingNumber % limit == 0 ? borrowingNumber / limit : borrowingNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("borrowing", borrowing);
        map.put("borrowingNumber", borrowingNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }

    @ResponseBody
    @RequestMapping("selectBorrowBooks")
    public List<BorrowingBookInformation> selectBorrowBooks(HttpSession session) {
        String identity = (String) session.getAttribute("identity");
        Admin user = null;
        if (identity.equals("student")) {
            user = (Student) session.getAttribute("user");
        } else if (identity.equals("teacher")) {
            user = (Teacher) session.getAttribute("user");
        }
        return userService.selectBorrowed(user.getID());
    }

    @ResponseBody
    @RequestMapping("renewBook")
    public Map borrowOrRenewBook(@RequestParam(value = "renewBooks", required = false) String[] renewBooks, HttpSession session) {
        String identity = (String) session.getAttribute("identity");
        Admin user = null;
        if (identity.equals("student")) {
            user = (Student) session.getAttribute("user");
        } else if (identity.equals("teacher")) {
            user = (Teacher) session.getAttribute("user");
        }
        Map map = new HashMap();
        boolean flag = true;
        if (renewBooks != null) {
            flag = userService.renew(identity, user.getID(), renewBooks);
        }
        if (flag) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "操作成功！");
        } else {
            map.put("modalTitle", "失败");
            map.put("modalPoint", "只可续借一次！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "selectBook")
    public Map<String, Object> selectBook(Book book,
                                          @RequestParam("page") int page,
                                          @RequestParam("limit") int limit) {
        int offset = (page - 1) * limit;
        Map<String, Boolean> check = new HashMap<>();
        List<Book> books = userService.selectBook(book, offset, limit);
        int bookNumber = userService.NumberOfBook(book);
        int pageNumber = bookNumber % limit == 0 ? bookNumber / limit : bookNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("books", books);
        map.put("bookNumber", bookNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }

    @RequestMapping("book")
    public String bookChange(@RequestParam(value = "ISBN", required = false) String ISBN, Model model) {
        if (ISBN != null) {
            model.addAttribute("book", userService.selectBookByISBN(ISBN));
        }
        return "book";
    }
}
