package controller.admin;

import entity.BorrowingBookInformation;
import entity.BorrowingInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.admin.AdminLogService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/log")
public class AdminLogController {

    private AdminLogService adminLogService;

    @Autowired
    public void setAdminLogService(AdminLogService adminLogService) {
        this.adminLogService = adminLogService;
    }

    @RequestMapping("log")
    public String log() {
        return "log";
    }

    @RequestMapping("overdue")
    public String overdue() {
        return "overdue";
    }

    @ResponseBody
    @RequestMapping("overduePage")
    public Map<String, Object> overduePage(@RequestParam("page") int page,
                                           @RequestParam("limit") int limit) {
        int offset = (page - 1) * limit;
        List<BorrowingInformation> overdue = adminLogService.overdue(offset, limit);
        int overdueNumber = adminLogService.NumberOfOverdue();
        int pageNumber = overdueNumber % limit == 0 ? overdueNumber / limit : overdueNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("overdue", overdue);
        map.put("overdueNumber", overdueNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }

    /**
     * 借阅记录当前正在借阅部分
     *
     * @param ID
     * @param page
     * @param limit
     * @return
     */
    @ResponseBody
    @RequestMapping("borrowing")
    public Map<String, Object> borrowing(@RequestParam("ID") String ID,
                                         @RequestParam("page") int page,
                                         @RequestParam("limit") int limit) {
        int offset = (page - 1) * limit;
        List<BorrowingBookInformation> borrowing = adminLogService.borrowing(ID, offset, limit);
        int borrowingNumber = adminLogService.NumberOfBorrowed(ID);
        int pageNumber = borrowingNumber % limit == 0 ? borrowingNumber / limit : borrowingNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("borrowing", borrowing);
        map.put("borrowingNumber", borrowingNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }

    /**
     * 借阅记录曾经借阅部分
     *
     * @param ID
     * @param page
     * @param limit
     * @return
     */
    @ResponseBody
    @RequestMapping("borrowed")
    public Map<String, Object> borrowed(@RequestParam("ID") String ID,
                                        @RequestParam("page") int page,
                                        @RequestParam("limit") int limit) {
        int offset = (page - 1) * limit;
        List<BorrowingBookInformation> borrowed = adminLogService.borrowed(ID, offset, limit);
        int borrowedNumber = adminLogService.NumberOfBorrowing(ID);
        int pageNumber = borrowedNumber % limit == 0 ? borrowedNumber / limit : borrowedNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("borrowed", borrowed);
        map.put("borrowedNumber", borrowedNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }
}
