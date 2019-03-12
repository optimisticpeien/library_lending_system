package controller.admin;

import bean.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.admin.AdminBookService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/book")
public class AdminBookController {

    private AdminBookService adminBookService;

    @Autowired
    public void setAdminBookService(AdminBookService adminBookService) {
        this.adminBookService = adminBookService;
    }

    @RequestMapping("add")
    public String bookAdd() {
        return "add";
    }

    @RequestMapping("change")
    public String bookChange(@RequestParam(value = "ISBN", required = false) String ISBN, Model model) {
        if (ISBN != null) {
            model.addAttribute("book", adminBookService.selectBookByISBN(ISBN));
        }
        return "change";
    }

    @RequestMapping("delete")
    public String bookDelete() {
        return "delete";
    }

    @RequestMapping("select")
    public String bookSelect() {
        return "select";
    }

    @ResponseBody
    @RequestMapping("addBook")
    public Map<String, String> addBook(Book book) {
        Map<String, String> map = new HashMap<>();
        if (adminBookService.bookAdd(book)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "添加图书成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "已经存在此ISBN的图书！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("updateBook")
    public Map<String, String> updateBook(Book book) {
        Map<String, String> map = new HashMap<>();
        if (adminBookService.bookUpdate(book)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "修改图书信息成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有此ISBN的图书！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("deleteBook")
    public Map<String, String> deleteBook(String ISBN) {
        Map<String, String> map = new HashMap<>();
        if (adminBookService.bookDelete(ISBN)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "删除图书信息成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有此ISBN的图书或此图书尚有书籍没有归还！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "changeBook/select", method = RequestMethod.POST)
    public Map<String, Object> changeSelect(@RequestParam("ISBN") String ISBN) {
        Map<String, Object> map = new HashMap<>();
        Book book = adminBookService.selectBookByISBN(ISBN);
        if (book == null) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有找到相关图书信息！");
        } else {
            map.put("modalTitle", "成功");
            map.put("book", book);
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "selectBook")
    public Map<String, Object> selectBook(Book book,
                                          @RequestParam("pricingCheck") boolean pricingCheck,
                                          @RequestParam("numberCheck") boolean numberCheck,
                                          @RequestParam("borrowCheck") boolean borrowCheck,
                                          @RequestParam("page") int page,
                                          @RequestParam("limit") int limit) {
        int offset = (page - 1) * limit;
        Map<String, Boolean> check = new HashMap<>();
        check.put("pricingCheck", pricingCheck);
        check.put("numberCheck", numberCheck);
        check.put("borrowCheck", borrowCheck);
        List<Book> books = adminBookService.selectBook(book, check, offset, limit);
        int bookNumber = adminBookService.NumberOfBook(book, check);
        int pageNumber = bookNumber % limit == 0 ? bookNumber / limit : bookNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("books", books);
        map.put("bookNumber", bookNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }
}
