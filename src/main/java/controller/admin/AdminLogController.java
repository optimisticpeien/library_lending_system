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

    @ResponseBody
    @RequestMapping("logPage")
    public Map<String, Object> logPage(@RequestParam("ID") String ID,
                                       @RequestParam("page") int page,
                                       @RequestParam("limit") int limit) {
        int offset = (page - 1) * limit;
        List<BorrowingBookInformation> borrowing = adminLogService.borrowingRecord(ID, offset, limit);
        int borrowingNumber = adminLogService.NumberOfLog(ID);
        int pageNumber = borrowingNumber % limit == 0 ? borrowingNumber / limit : borrowingNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("borrowing", borrowing);
        map.put("borrowingNumber", borrowingNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }
}
